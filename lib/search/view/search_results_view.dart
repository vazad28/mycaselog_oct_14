part of 'search_page.dart';

class SearchResultsView extends ConsumerWidget with SearchMixin {
  const SearchResultsView({
    required this.searchResults,
    required this.searchType,
    super.key,
  });

  final RealmResults<RealmObject>? searchResults;
  final SearchType searchType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchResults?.isEmpty ?? true) {
      return const Loading(text: 'No results');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildResultsCount(context, searchResults!),
        Divider(
          height: 1,
          color: context.colorScheme.onSurface.lighter(),
        ),
        Expanded(
          child: searchType == SearchType.cases
              ? _buildResultsList(searchResults!)
              : _buildResultsGrid(searchResults!),
        ),
      ],
    );
  }

  Widget _buildResultsCount(
    BuildContext context,
    RealmResults<RealmObject> searchResults,
  ) {
    return SizedBox(
      height: kToolbarHeight * 0.5,
      child: Row(
        children: [
          const SizedBox(width: AppSpacing.md),
          Text(
            '${searchResults.length} RESULTS',
            style: context.textTheme.bodyMedium?.lighter(),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList(RealmResults<RealmObject> searchResults) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final model = searchResults.elementAt(index) as CaseModel;
        return CasesSearchResultTile(
          caseModel: model,
          key: Key('__CasesSearchResultTile_${model.caseID}_key__'),
        );
      },
      itemCount: searchResults.length,
    );
  }

  Widget _buildResultsGrid(RealmResults<RealmObject> searchResults) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final widgetKey = constraints.maxWidth <= Breakpoints.mobile
            ? const Key('__MediasSearch_list_key__')
            : const Key('__MediasSearch_grid_key__');

        final crossAxisCount = constraints.maxWidth ~/ 90;

        return GridView.builder(
          key: widgetKey,
          itemCount: searchResults.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: AppSpacing.xs,
            crossAxisSpacing: AppSpacing.xs,
          ),
          itemBuilder: (context, int index) {
            final model = searchResults.elementAt(index) as MediaModel;
            return MediaSearchResultTile(
              mediaModel: model,
              key: Key('__MediaSearchResultTile_${model.mediaID}_key__'),
              results: searchResults as RealmResults<MediaModel>,
              width: 90,
            );
          },
        );
      },
    );
  }
}
