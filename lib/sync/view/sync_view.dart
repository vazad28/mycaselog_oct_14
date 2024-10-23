import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

import '../sync.dart';

const _collectionsOrder = [
  DbCollection.cases,
  DbCollection.media,
  DbCollection.timelineNotes,
  DbCollection.notes,
  DbCollection.templates,
  DbCollection.supportData,
  DbCollection.settings,
];

class SyncView extends ConsumerWidget {
  const SyncView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _collectionsOrder.length,
      itemBuilder: (context, index) {
        final dbCollection = _collectionsOrder[index];

        final syncStateProvider = ref.watch(syncNotifierProvider(dbCollection));
        final notifier = ref.watch(syncNotifierProvider(dbCollection).notifier);

        return ListTile(
          minTileHeight: kToolbarHeight,
          title: Text(
            dbCollection.name.camelToTitleCase,
            style: context.textTheme.titleMedium,
          ),
          trailing: syncStateProvider.maybeWhen(
            success: (syncedIds) => TextButton(
              onPressed: () {
                if (!syncStateProvider.isLoading) _onPressed(context, notifier);
              },
              child: Text('${syncedIds.length}'),
            ),
            loading: (_) => const CircularProgressIndicator.adaptive(),
            failure: (_) => const Text('Error'),
            orElse: () => TextButton(
              onPressed: () {
                if (!syncStateProvider.isLoading) _onPressed(context, notifier);
              },
              child: const Text('sync'),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 0.5,
          indent: 16,
          endIndent: 16,
        );
      },
    );
  }

  void _onPressed(BuildContext context, SyncNotifier notifier) {
    context.openDraggableBottomSheet<void>(
      builder: (_) {
        /// Bottom sheet to select 'time since' for syncing data
        return SyncBottomSheet(
          onSelect: (timestamp) {
            if (timestamp == null) return;
            notifier.syncCollection(timestamp);
          },
        );
      },
    );
  }
}
