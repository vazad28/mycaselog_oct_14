import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../add_field.dart';

class FieldOptionsView extends ConsumerWidget with AddFieldFormMixin {
  const FieldOptionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFieldType = ref.watch(templateFieldTypeProvider);

    return AnimatedOpacity(
      opacity: (currFieldType == FieldType.radio ||
              currFieldType == FieldType.select)
          ? 1
          : 0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddFieldOptionBar(
            onAddOption: (option) {
              ref
                  .watch(templateFieldOptionsProvider.notifier)
                  .updateFieldOption(option);
            },
          ),
          const Expanded(child: _AddFieldOptionsList()),
        ],
      ),
    );
  }
}

class _AddFieldOptionsList extends ConsumerWidget {
  const _AddFieldOptionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(templateFieldOptionsProvider.notifier);
    final fieldOptions = ref.watch(templateFieldOptionsProvider);

    return (fieldOptions?.isEmpty ?? true)
        ? const Center(child: Loading(text: 'Add an option for select'))
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: fieldOptions!
                .toList()
                .asMap()
                .entries
                .map(
                  (entry) => FieldOptionTile(
                    entry: entry,
                    onDelete: () {
                      context
                          .showConfirmDialog(
                        S.of(context).areYouSure,
                        title: S.of(context).alert,
                      )
                          .then((res) {
                        if (res == false) return;
                        notifier.removeFieldOption(entry.value);
                      });
                    },
                    onTap: () async {
                      final res = await context.showInputDialog<String?>(
                        title: S.of(context).addOption,
                        value: entry.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\n')),
                        ],
                      );
                      if (res?.isEmpty ?? true) return;
                      notifier.updateFieldOption(entry.value);
                    },
                  ),
                )
                .toList(),
          );
  }
}
