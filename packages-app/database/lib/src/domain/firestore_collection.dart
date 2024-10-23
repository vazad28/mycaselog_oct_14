import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database.dart';
import '../mixins/refresh_backlinks_mixin.dart';

abstract class FirestoreCollection<T extends RealmObject>
    with RefreshBacklinksMixin {
  FirestoreCollection(
    RealmDatabase realmDatabase, // Realm database instance
  )   : realm = realmDatabase.realm, // Realm instance for local data storage
        userID = realmDatabase.user.id,
        sharedPrefs = realmDatabase.sharedPrefs,
        errorStream = realmDatabase.databaseErrorStream {
    /// listen for changes in realm locally to save in firestore
    if (!realmDatabase.user.isAnonymous) _syncToFirestore();
  }

  final Realm realm;
  final String userID;
  final SharedPreferences sharedPrefs;
  final StreamController<DbException> errorStream;

  final String root = 'usersData';
  String get path;

  /// Firestore instance for accessing the database
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Getter for the Firestore collection reference
  CollectionReference<Map<String, dynamic>> get collectionRef =>
      firestore.collection(path);

  /// Function to retrieve the primary key value for a given model object.
  String getPrimaryKey(T model);

  /// Function to convert a Map<String, dynamic> to a model object.
  T mapToModel(Map<String, dynamic> json);

  /// Function to convert a model object to a Map<String, dynamic>.
  Map<String, dynamic> modelToMap(T model);

  /// ////////////////////////////////////////////////////////////////////
  /// Firestore sync
  /// ////////////////////////////////////////////////////////////////////
  /// Flag to indicate ignoring changes from the firestore database.
  bool ignoreFirestoreChanges = true;

  /// Flag to indicate ignoring changes from the Realm database.
  bool ignoreRealmChanges = false;

  /// sync cases data based on timestamp
  Future<List<String>> syncByTimestamp({int? timestamp}) async {
    logger.info('timestamp syncByTimestamp = $timestamp');
    ignoreRealmChanges = true;

    final query = collectionRef.where(
      'timestamp',
      isGreaterThan: timestamp ?? getLastSyncTimestamp,
    );

    final snapshot = await query.get();

    final ids = <String>[];

    // Use batch operations and async/await
    await realm.writeAsync(() {
      for (final e in snapshot.docs) {
        final model = mapToModel(e.data());
        ids.add(getPrimaryKey(model));
        realm.add(model, update: true);
      }

      if (T == MediaModel) {
        refreshMediaBacklinks(realm, ids);
      } else if (T == TimelineNoteModel) {
        refreshTimelineNotesBacklinks(realm, ids);
      } else if (T == CaseModel) {
        refreshCasesBacklinks(realm, ids);
      }
    }).catchError((Object? err) {
      logger.error(err.toString());
      errorStream.add(DbException(err.toString()));
    }).whenComplete(() {
      logger.info(ids.length.toString());
      Future<void>.delayed(Durations.short1).then((_) {
        ignoreRealmChanges = false;
      });
    });

    return ids;
  }

  /// ////////////////////////////////////////////////////////////////////
  /// SYNC TO FIRESTORE
  /// Synchronizes data from Realm to Firestore.
  /// Listens for changes in Realm and adds/modifies/deletes data
  /// in Firestore accordingly.
  /// ////////////////////////////////////////////////////////////////////
  void _syncToFirestore() {
    final models = realm.all<T>();

    models.changes.listen((changes) async {
      if (ignoreRealmChanges) return;

      ignoreFirestoreChanges = true; // Prevent infinite loop

      for (final index in changes.inserted) {
        debugPrint('Received model $T from Realm to sync (inserted)');
        _addToFirestore(models[index]);
      }

      for (final index in changes.modified) {
        debugPrint('Received model $T from Realm to sync (modified)');
        _addToFirestore(models[index]);
      }

      for (final index in changes.deleted) {
        debugPrint('Received model $T from Realm to sync (deleted)');
        _deleteFromFirestore(getPrimaryKey(models[index]));
      }

      // Reset flag after a short delay to avoid conflicts
      await Future<void>.delayed(const Duration(milliseconds: 300)).then((_) {
        ignoreFirestoreChanges = false;
      });
    }, onError: (Object err) {
      errorStream.add(DbException('$err ?? syncToFirestore error'));
    },);
  }

  /// Adds a model object to Firestore.
  void _addToFirestore(T model) {
    final docId = getPrimaryKey(model);
    final modelToFirestore = modelToMap(model);

    collectionRef.doc(docId).set(modelToFirestore).then((_) {
      debugPrint('Successfully added model to Firestore');
    }).catchError((Object err) {
      debugPrint('Error adding to Firestore: $err');
      errorStream.add(DbException(err.toString()));
    });
  }

  /// Deletes a model object from Firestore.
  void _deleteFromFirestore(String docId) {
    collectionRef.doc(docId).delete().catchError((dynamic err) {
      debugPrint('Error deleting from Firestore: $err');
      errorStream.add(DbException(err.toString()));
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// timestamp local storage methods
  /// ////////////////////////////////////////////////////////////////////
  // Key used to store the last sync timestamp in SharedPreferences
  final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';

  // Retrieves the last sync timestamp from SharedPreferences
  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  // Sets the last sync timestamp in SharedPreferences
  void setLastSyncTimestamp() {
    sharedPrefs.setInt(_lastSyncTimestampKey, ModelUtils.getTimestamp);
  }
}
