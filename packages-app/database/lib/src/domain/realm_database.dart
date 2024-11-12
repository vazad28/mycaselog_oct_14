import 'dart:async';

import 'package:authentication_client/authentication_client.dart';
import 'package:flutter/foundation.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

import '../../database.dart';
import 'secure_key_generator.dart';

class RealmDatabase {
  final Realm realm;
  final AuthenticationUser user;
  final SharedPreferences sharedPrefs;
  final StreamController<DbException> databaseErrorStream;

  // Define the initial schema version
  static const initialSchemaVersion = 1;

  // ignore: sort_constructors_first
  RealmDatabase._(
    this.realm,
    this.user,
    this.sharedPrefs,
    this.databaseErrorStream,
  );

  static Future<RealmDatabase> init(
    AuthenticationUser user,
    SecureStorage secureStorage,
    StreamController<DbException> databaseErrorStream,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    if (user.isAnonymous) {
      final realm = await _createRealm(user, null);
      return RealmDatabase._(realm, user, sharedPrefs, databaseErrorStream);
    }

    String? enck;
    enck = await secureStorage.read(
      key: '__enck_${user.id}__',
    );

    if (enck?.isEmpty ?? true) {
      //64 bit key required by realm
      enck = SecureKeyGenerator.generateSecureKeyHex(64);
      await secureStorage.write(
        key: '__enck_${user.id}__',
        value: enck,
      );
    }

    if (enck?.isEmpty ?? true) throw Exception('No encryption key');

    final enckToIntList = SecureKeyGenerator.toUnit8List(enck!);

    final realm =
        await _createRealm(user, enckToIntList).catchError((Object err) {
      throw Exception(err.toString());
    });
    return RealmDatabase._(realm, user, sharedPrefs, databaseErrorStream);
  }

  // ignore: unused_element
  static void _migrationCallback(Migration migration, int oldSchemaVersion) {
    if (oldSchemaVersion < 3) {
      // Add a full-text index to the 'name' field in  PatientModel
      /// No specific code required for adding index
    }
  }

  static Future<Realm> _createRealm(
    AuthenticationUser user,
    Uint8List? enckToIntList,
  ) async {
    Configuration.defaultRealmName = '${user.id}.realm';

    /// on sign out we want  to return empty realm
    /// to  prevent collections recreated and starting listeners
    if (user.isAnonymous) return Realm(Configuration.local([]));

    final config = Configuration.local(
      [
        AssistantModel.schema,
        CaseModel.schema,
        MediaModel.schema,
        NoteModel.schema,
        PatientModel.schema,
        SettingsModel.schema,
        SharedTemplateModel.schema,
        SupportDataModel.schema,
        SurgeryLocationModel.schema,
        TemplateFieldModel.schema,
        TemplateModel.schema,
        TimelineNoteModel.schema,
        UserModel.schema,
      ],
      shouldDeleteIfMigrationNeeded: kDebugMode,
      encryptionKey: enckToIntList,
      // schemaVersion: 3,
      //migrationCallback: _migrationCallback,
    );

    return Realm(config);
  }
}
