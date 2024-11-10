part of 'search_page.dart';

class SuggestionsView extends ConsumerWidget {
  const SuggestionsView({
    required this.searchController,
    required this.onTap,
    super.key,
  });

  final SearchController searchController;
  final void Function(String searchTerm) onTap;

  Iterable<Widget> getHistoryWidgetsList(BuildContext context, WidgetRef ref) {
    final query = searchController.value.text.trim();

    final result =
        ref.watch(searchNotifierProvider.notifier).getSuggestions(query);

    return result.map(
      (String suggestion) => InkResponse(
        child: _SuggestionTile(
          suggestion: suggestion,
          searchController: searchController,
        ),
        onTap: () => onTap(suggestion),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = getHistoryWidgetsList(context, ref);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => DismissibleListTile(
        key: ValueKey(index), // Add a unique key for each DismissibleListTile
        child: children.elementAt(index), // Use direct indexing for efficiency
        onDismissed: () => ref
            .watch(searchNotifierProvider.notifier)
            .onSearchQueryRemove(index),
      ),
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemCount: children.length,
    );
  }
}

class _SuggestionTile extends ConsumerWidget {
  const _SuggestionTile({
    required this.suggestion,
    required this.searchController,
  });

  final String suggestion;
  final SearchController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const HorizontalSpacer.small(),
        const Icon(Icons.arrow_right),
        const HorizontalSpacer.small(),
        Expanded(
          child: Text(
            suggestion,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            searchController
              ..text = suggestion
              ..selection = TextSelection.collapsed(
                offset: searchController.text.length,
              );
          },
        ),
        const HorizontalSpacer.xsmall(),
      ],
    );
  }
}
