import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../search/search.dart';
import '../cases.dart';

class CasesSearchBar extends ConsumerWidget {
  const CasesSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      primary: false,
      pinned: true,
      expandedHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      scrolledUnderElevation: 0.5,
      shadowColor: context.colorScheme.shadow.lighter(),
      surfaceTintColor: context.colorScheme.surface,
      titleSpacing: AppSpacing.md,
      title:
          // IconButton(
          //     onPressed: () {
          //       context.openModalPage<void>(child: const SearchPage<CaseModel>());
          //     },
          //     icon: Icon(Icons.search)),
          SearchPage<CaseModel>(
              // anchorStyle: SearchBarStyle.bar,
              // onSearch: (searchTerm) {
              //   return ref
              //       .watch(casesNotifierProvider.notifier)
              //       .searchCases(searchTerm);
              //},
              ),
      actions: const [
        _CaseTileStyleWidget(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}

class _CaseTileStyleWidget extends ConsumerWidget {
  const _CaseTileStyleWidget({super.key});

  static const _tileDisplayIcons = [
    Icon(Icons.format_list_bulleted),
    Icon(Icons.list_alt),
    Icon(Icons.storage),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = ref.watch(caseTileStyleProvider);

    return IconButton(
      onPressed: () {
        final toggledStyle = caseTileStyle == 2 ? 0 : caseTileStyle + 1;
        ref.watch(caseTileStyleProvider.notifier).update(toggledStyle);
      },
      icon: _tileDisplayIcons[caseTileStyle],
    );
  }
}
