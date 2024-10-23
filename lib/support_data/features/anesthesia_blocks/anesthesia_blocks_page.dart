import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../../shared/shared.dart';
import '../../support_data.dart';

class AnesthesiaBlocksPage extends ConsumerWidget with SupportDataMixin {
  const AnesthesiaBlocksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).anesthesiaBlock.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context
                  .showInputDialog<String?>(
                title: S.of(context).anesthesiaBlock.titleCase,
              )
                  .then((value) {
                if (value == null) return;
                ref
                    .watch(supportDataNotifierProvider.notifier)
                    .upsertAnesthesiaBlock(value, CrudAction.add);
              });
            },
          ),
        ],
      ),
      body: const AnesthesiaBlocksView(),
    );
  }
}

class AnesthesiaBlocksView extends ConsumerWidget with SupportDataMixin {
  const AnesthesiaBlocksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = watchAnesthesiaBlocks(ref);

    if (blocks.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No Anesthesia Block',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: blocks.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final block = blocks[index];
        final child = ListTile(
          title: Text(block),
          onTap: () {
            context
                .showInputDialog<String?>(
                    title: 'Anesthesia Block', value: block)
                .then((newBlock) {
              if (newBlock == null || newBlock.isEmpty) return;
              ref
                  .watch(supportDataNotifierProvider.notifier)
                  .upsertAnesthesiaBlock(block, CrudAction.edit);
            });
          },
        );

        return DismissibleListTile(
          child: child,
          onDismissed: () {
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertAnesthesiaBlock(block, CrudAction.delete);
          },
        );
      },
    );
  }
}
