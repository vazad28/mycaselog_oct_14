part of 'search_provider.dart';

mixin SearchMixin {
  SearchType watchSearchType(WidgetRef ref) =>
      ref.watch(searchNotifierProvider);

  void updateSearchType(WidgetRef ref, SearchType searchType) {
    ref.watch(searchNotifierProvider.notifier).update(searchType);
  }

  SearchType createSearchType<T>() {
    return switch (T) {
      CaseModel => SearchType.cases,
      MediaModel => SearchType.media,
      NoteModel => SearchType.notes,
      Type() => throw UnimplementedError(),
    };
  }

  RealmResults<RealmObject> doSearch(WidgetRef ref, String searchTerm) {
    return ref.watch(searchNotifierProvider.notifier).doSearch(searchTerm);
  }
}
