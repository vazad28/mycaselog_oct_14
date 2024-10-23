import 'dart:async';

import 'package:authentication_client/authentication_client.dart';
import 'package:flutter/foundation.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database.dart';

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
    StreamController<DbException> databaseErrorStream,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final realm = await _createRealm(user);
    return RealmDatabase._(realm, user, sharedPrefs, databaseErrorStream);
  }

  // ignore: unused_element
  static void _migrationCallback(Migration migration, int oldSchemaVersion) {
    if (oldSchemaVersion < 3) {
      // Add a full-text index to the 'name' field in  PatientModel
      /// No specific code required for adding index
    }
  }

  static Future<Realm> _createRealm(AuthenticationUser user) async {
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
      // schemaVersion: 3,
      //migrationCallback: _migrationCallback,
    );

    return Realm(config);
  }
}
