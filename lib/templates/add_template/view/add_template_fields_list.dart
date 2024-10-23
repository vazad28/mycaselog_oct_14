import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../add_field/add_field.dart';
import '../add_template.dart';

class AddTemplateFieldList extends ConsumerWidget with AddTemplateFieldsMixin {
  const AddTemplateFieldList({super.key});

  /// if the temlplate has no fields
  Widget _importFieldButton(BuildContext context, WidgetRef ref) => Center(
        key: const Key('__add_template_no_fields_widget__'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => context
                  .openModalPage<TemplateModel?>(
                child: const ImportTemplateFieldsModal(),
              )
                  .then((templateModel) {
                if (templateModel == null) return;
                importFields(ref, templateModel);
              }),
              child: Text(S.of(context).importFields),
            ),
            Text(
              'Import fields from your other templates',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsList = templateFieldsListState(ref);

    /// if we have fields
    return (fieldsList?.isEmpty ?? true)
        ? _importFieldButton(context, ref)
        : ReorderableListView(
            shrinkWrap: true,
            children: fieldsList!
                .asMap()
                .entries
                .map(
                  (entry) => Material(
                    key: ValueKey(entry.value),
                    color: context.colorScheme.surface,
                    child: TemplateFieldTile(
                      templateField: entry.value,
                      onDelete: () {
                        fieldsList
                            .removeAt(entry.key); //entry.key is mapEntry index
                        reOrderFields(ref, fieldsList);
                      },
                      onTap: () {
                        context
                            .openModalPage<TemplateFieldModel?>(
                          child: AddFieldPage(
                            templateFieldModel: entry.value,
                          ),
                        )
                            .then((templateModel) {
                          if (templateModel != null) {
                            addUpdateField(ref, templateModel);
                          }
                        });
                      },
                    ),
                  ),
                )
                .toList(),
            // The reorder function
            onReorder: (oldIndex, newIndex) {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = fieldsList.removeAt(oldIndex);
              fieldsList.insert(newIndex, element);
              reOrderFields(ref, fieldsList);
            },
          );
  }
}
