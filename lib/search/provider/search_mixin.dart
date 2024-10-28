import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';

import '../../app/app.dart';

mixin SearchMixin {
  /// Full text search cases
  RealmResults<CaseModel> searchCases(WidgetRef ref, String searchTerm) {
    return ref.watch(collectionsProvider).casesCollection.search(searchTerm);
  }

  /// Full text search notes
  RealmResults<MediaModel> searchMedia(WidgetRef ref, String searchTerm) {
    final caseResults =
        ref.watch(collectionsProvider).casesCollection.search(searchTerm);

    // list of case IDs matching the search term
    final ids = caseResults.map((e) => e.caseID);

    return ref.watch(collectionsProvider).mediaCollection.search(ids);
  }

  /// Full text search notes
  RealmResults<NoteModel> searchNotes(
    WidgetRef ref,
    String searchTerm,
  ) {
    return ref.watch(collectionsProvider).notesCollection.search(searchTerm);
  }
}
