import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../cases/cases.dart';
import '../../media/media.dart';
import '../search.dart';

part './cases/cases_tile_style.dart';

class CaseMediaSearchBar extends ConsumerWidget with SearchMixin {
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
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(4),
        child: SizedBox.shrink(),
      ),
      title: searchType == SearchType.cases
          ? SearchView<CaseModel>(
              anchorStyle: SearchBarStyle.bar,
              searchType: searchType,
              onSearch: (searchTerm) => searchCases(ref, searchTerm),
            )
          : SearchView<MediaModel>(
              anchorStyle: SearchBarStyle.bar,
              searchType: searchType,
              onSearch: (searchTerm) => searchMedia(ref, searchTerm),
            ),
      actions: [
        if (searchType == SearchType.cases)
          const CaseTileStyleWidget()
        else
          const MediaTileStyleToggle(),
        const SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
