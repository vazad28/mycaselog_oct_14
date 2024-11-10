import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app.dart';

part '../../generated/search/provider/search_provider.g.dart';
part './search_mixin.dart';

//@Riverpod(keepAlive: true)
@riverpod
class SearchNotifier extends _$SearchNotifier {
  List<String> searchHistory = [];

  @override
  SearchType build() {
    searchHistory = ref.read(localStorageProvider).getCaseMediaRecentSearches();
    return SearchType.cases;
  }

  /// update the state of the search type
  void update(SearchType searchType) => state = searchType;

  RealmResults<RealmObject> doSearch(String searchTerm) {
    updateSearchHistory(searchTerm);

    final results = state == SearchType.cases
        ? _searchCases(searchTerm)
        : _searchMedia(searchTerm);

    return results;
  }

  List<String> getSuggestions(String query) {
    return query.isNotEmpty
        ? searchHistory
            .where(RegExp(query, caseSensitive: false).hasMatch)
            .toList()
        : searchHistory;
  }

  void updateSearchHistory(String query) {
    if (!searchHistory.contains(query)) {
      searchHistory.insert(0, query);
    }

    if (searchHistory.length >= 25) {
      searchHistory.removeLast();
    }

    ref.read(localStorageProvider).setCaseMediaRecentSearches(searchHistory);
  }

  void onSearchQueryRemove(int index) {
    searchHistory.removeAt(index);
    ref.read(localStorageProvider).setCaseMediaRecentSearches(searchHistory);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local Methods
  /// ////////////////////////////////////////////////////////////////////
  /// Full text search cases
  RealmResults<CaseModel> _searchCases(
    String searchTerm,
  ) {
    return ref.watch(dbProvider).casesCollection.search(searchTerm);
  }

  /// Full text search notes
  RealmResults<MediaModel> _searchMedia(
    String searchTerm,
  ) {
    final caseResults =
        ref.watch(dbProvider).casesCollection.search(searchTerm);

    // list of case IDs matching the search term
    final ids = caseResults.map((e) => e.caseID);

    return ref.watch(dbProvider).mediaCollection.search(ids);
  }

  /// Full text search notes
  // ignore: unused_element
  RealmResults<NoteModel> _searchNotes(
    String searchTerm,
  ) {
    return ref.watch(dbProvider).notesCollection.search(searchTerm);
  }
}
