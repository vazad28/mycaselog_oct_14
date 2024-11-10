import 'dart:io' show File;

import 'package:annotations/annotations.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';

import '../domain/realm_collection.dart';
import '../domain/realm_database.dart';
import '../mixins/refresh_backlinks_mixin.dart';

part './cases_collection.dart';
part './media_collection.dart';
part './notes_collection.dart';
part './settings_collection.dart';
part './storage_collection.dart';
part './support_data_collection.dart';
part './templates_collection.dart';
part './timeline_notes_collection.dart';
part './user_collection.dart';

class Collections {
  Collections({
    required RealmDatabase realmDatabase,
  })  : storageCollection = StorageCollection(realmDatabase),
        casesCollection = CasesCollection(realmDatabase),
        mediaCollection = MediaCollection(realmDatabase),
        notesCollection = NotesCollection(realmDatabase),
        userCollection = UserCollection(realmDatabase),
        settingsCollection = SettingsCollection(realmDatabase),
        supportDataCollection = SupportDataCollection(realmDatabase),
        timelineNotesCollection = TimelineNotesCollection(realmDatabase),
        templatesCollection = TemplatesCollection(realmDatabase);

  /// Collections vars
  final StorageCollection storageCollection;
  final CasesCollection casesCollection;
  final MediaCollection mediaCollection;
  final NotesCollection notesCollection;
  final UserCollection userCollection;
  final SupportDataCollection supportDataCollection;
  final SettingsCollection settingsCollection;
  final TimelineNotesCollection timelineNotesCollection;
  final TemplatesCollection templatesCollection;
}
