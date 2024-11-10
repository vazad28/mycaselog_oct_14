import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

import '../stats.dart';
import 'stats_search_anchor.dart';

part 'stats_search_phrase_list.dart';

class StatsSearchBar extends ConsumerWidget
    with StatsMixin
    implements PreferredSizeWidget {
  const StatsSearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;

    final controller =
        ref.watch(statsNotifierProvider.notifier).searchController;

    return orientation == Orientation.landscape
        ? AppBar(
            elevation: 0,
            toolbarHeight: 0,
            surfaceTintColor: chartsTheme.chartBackgroundColor,
          )
        : AppBar(
            backgroundColor: chartsTheme.chartBackgroundColor,
            titleSpacing: AppSpacing.md,
            toolbarHeight: kToolbarHeight + AppSpacing.md,
            elevation: 0,
            title: StatsSearchAnchor(
              hintText: 'search stats',
              onTap: (String? searchTermTokenized) {
                searchStats(ref, searchTermTokenized, null);
              },
              searchController: controller,
              suggestions: StatsSearchPhrasesList(searchController: controller),
              trailing: const [_StatsResultCount()],
            ),
            actions: [
              _StatsSearchBarTrailing(searchController: controller),
              const SizedBox(width: AppSpacing.sm),
            ],
          );
  }
}

class _StatsResultCount extends ConsumerWidget {
  const _StatsResultCount();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsDataModelAsync = ref.watch(statsDataProvider);
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    final child = statsDataModelAsync.maybeWhen(
      success: (chartDataModel) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Text(
          chartDataModel.data
              .map((e) => e.data)
              .toList()
              .flattened
              .length
              .toString(),
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
      failure: (f) => const Text(' '),
      orElse: () => const Text('0'),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}

class _StatsSearchBarTrailing extends ConsumerStatefulWidget {
  const _StatsSearchBarTrailing({required this.searchController});

  final SearchController searchController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __StatsSearchBarTrailingState();
}

class __StatsSearchBarTrailingState
    extends ConsumerState<_StatsSearchBarTrailing> with StatsMixin {
  @override
  void initState() {
    widget.searchController.addListener(() {
      setState(() {
        _showClearButton = widget.searchController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  bool _showClearButton = false;

  @override
  Widget build(BuildContext context) {
    //final chartReqModel = ref.watch(statsNotifierProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: _showClearButton
          ? IconButton.filled(
              color: context.colorScheme.onPrimary,
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.close),
              onPressed: () {
                searchStats(ref, null, null);
                widget.searchController.clear();
              },
            )
          : const SizedBox.shrink(),
    );
  }
}