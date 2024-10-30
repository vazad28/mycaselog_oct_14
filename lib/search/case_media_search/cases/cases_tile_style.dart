part of '../case_media_search_bar.dart';

class CaseTileStyleWidget extends ConsumerWidget {
  const CaseTileStyleWidget({super.key});

  static const _tileDisplayIcons = [
    Icon(Icons.list_alt),
    Icon(Icons.format_list_bulleted),
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
