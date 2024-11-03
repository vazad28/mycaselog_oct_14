part of 'search_view.dart';

class ResultsView<T> extends StatelessWidget {
  const ResultsView(
    this.searchResultWidgets, {
    required this.searchType,
    super.key,
  });

  final Iterable<Widget> searchResultWidgets;
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildResultsCount(context),
        Divider(
          height: 1,
          color: context.colorScheme.onSurface.lighter(0.8),
        ),
        Expanded(
          child: searchType == SearchType.cases
              ? _buildResultsList()
              : _buildResultsGrid(),
        ),
      ],
    );
  }

  Widget _buildResultsCount(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight * 0.5,
      child: Row(
        children: [
          const SizedBox(width: AppSpacing.md),
          Text(
            '${searchResultWidgets.length} RESULTS',
            style: context.textTheme.bodyMedium?.lighter(),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => searchResultWidgets.elementAt(index),
      itemCount: searchResultWidgets.length,
    );
  }

  Widget _buildResultsGrid() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final widgetKey = constraints.maxWidth <= Breakpoints.mobile
            ? const Key('__MediasSearch_list_key__')
            : const Key('__MediasSearch_grid_key__');

        final crossAxisCount = constraints.maxWidth ~/ 90;

        return GridView.builder(
          key: widgetKey,
          itemCount: searchResultWidgets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: AppSpacing.xs,
            crossAxisSpacing: AppSpacing.xs,
          ),
          itemBuilder: (context, int index) {
            return searchResultWidgets.elementAt(index);
          },
        );
      },
    );
  }
}
