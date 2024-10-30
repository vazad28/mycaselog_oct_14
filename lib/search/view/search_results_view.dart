part of 'search_view.dart';

class ResultsView<T> extends StatelessWidget {
  const ResultsView(this.searchResultWidgets,
      {super.key, required this.searchType});

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
        Expanded(child: _buildResultsList()),
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
    return searchType == SearchType.media
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                searchResultWidgets.elementAt(index),
            itemCount: searchResultWidgets.length,
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                searchResultWidgets.elementAt(index),
            itemCount: searchResultWidgets.length,
          );
  }
}
