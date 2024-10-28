import 'package:annotations/annotations.dart';
import 'package:database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

import '../../app/app.dart';

part '../../generated/sync/provider/sync_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, RealmCollection> build() {
    final database = ref.watch(collectionsProvider);

    final collectionsMap = <DbCollection, RealmCollection>{
      DbCollection.cases: database.casesCollection,
      DbCollection.media: database.mediaCollection,
      DbCollection.timelineNotes: database.timelineNotesCollection,
      DbCollection.notes: database.notesCollection,
      DbCollection.templates: database.templatesCollection,
      DbCollection.supportData: database.supportDataCollection,
      DbCollection.settings: database.settingsCollection,
    };

    return collectionsMap;
  }
}

@Riverpod(keepAlive: true)
class SyncNotifier extends _$SyncNotifier {
  @override
  StateOf<List<String>> build(DbCollection dbCollection) {
    return const StateOf<List<String>>.init();
  }

  void syncCollection(int timestamp) {
    final collectionsMap = ref.read(syncCollectionsMapProvider);
    final collection = collectionsMap[dbCollection];

    if (collection == null) {
      state = StateOf<List<String>>.failure(
        Exception('No such collection'),
      );
      return;
    }

    state = const StateOf<List<String>>.loading();

    collection.syncByTimestamp(timestamp: timestamp).then((ids) async {
      state = StateOf<List<String>>.success(ids);
    }).catchError((Object? err) {
      state = StateOf<List<String>>.failure(Exception(err));
    });
  }
}
