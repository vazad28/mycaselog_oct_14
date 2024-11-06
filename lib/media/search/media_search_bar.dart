import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../search/search.dart';
import '../provider/media_provider.dart';
import '../widget/media_tile_style_toggle.dart';

class MediaSearchBar extends ConsumerWidget with SearchMixin {
  const MediaSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      primary: false,
      pinned: true,
      expandedHeight: kToolbarHeight + AppSpacing.sm,
      collapsedHeight: kToolbarHeight + AppSpacing.sm,
      scrolledUnderElevation: 0.5,
      shadowColor: context.colorScheme.shadow.lighter(),
      surfaceTintColor: context.colorScheme.surface,
      titleSpacing: AppSpacing.md,
      title: const SearchPage<MediaModel>(
        trailingWidgets: [_MediaCountWidget()],
      ),
      actions: const [
        MediaTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}

class _MediaCountWidget extends ConsumerWidget {
  const _MediaCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(mediaNotifierProvider),
      data: (data) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Text(
          data.results.length.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
