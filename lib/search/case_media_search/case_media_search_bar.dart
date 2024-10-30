import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../cases/cases.dart';
import '../search.dart';

part './cases/cases_tile_style.dart';

class CaseMediaSearchBar extends ConsumerWidget {
  const CaseMediaSearchBar({
    required this.searchType,
    super.key,
  });

  final SearchType searchType;

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
      title: SearchView<CaseModel>(
        anchorStyle: SearchBarStyle.bar,
        searchType: searchType,
        onSearch: (searchTerm) {
          return ref
              .watch(casesNotifierProvider.notifier)
              .searchCases(searchTerm);
        },
      ),
      actions: const [
        CaseTileStyleWidget(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
