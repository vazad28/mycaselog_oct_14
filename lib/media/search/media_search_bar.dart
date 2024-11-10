part of '../view/media_page.dart';

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
        trailingWidgets: [
          _MediaCountWidget(),
        ],
      ),
      actions: const [
        _MediaTileStyleWidget(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}

class _MediaTileStyleWidget extends ConsumerWidget {
  const _MediaTileStyleWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(mediaGridTileStyleProvider);

    // ignore: require_trailing_commas
    return IconButton(
      onPressed: () {
        final toggledStyle = style == 1 ? 0 : 1;
        ref.watch(mediaGridTileStyleProvider.notifier).update(toggledStyle);
      },
      icon:
          style == 0 ? const Icon(Icons.grid_on) : const Icon(Icons.grid_view),
    );
  }
}

class _MediaCountWidget extends ConsumerWidget {
  const _MediaCountWidget();

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
