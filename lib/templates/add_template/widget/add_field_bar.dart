import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../add_field/add_field.dart';
import '../../index.dart';

class AddFieldBar extends ConsumerWidget
    with AddTemplateFormMixin, AddTemplateFieldsMixin {
  const AddFieldBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget button = FilledButton.icon(
      onPressed: () {
        context
            .openModalPage<TemplateFieldModel?>(
          child: AddFieldPage(
            templateFieldModel: TemplateFieldModelX.zero(),
          ),
        )
            .then((templateModel) {
          if (templateModel != null) {
            addUpdateField(ref, templateModel);
          }
        });
      },
      icon: const Icon(Icons.add),
      label: Text(S.of(context).addField),
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
    );

    final Widget tile = Row(
      children: [
        const HorizontalSpacer.normal(),
        Expanded(
          child: Text(S.of(context).addField.toUpperCase()),
        ),
        button,
        const HorizontalSpacer.normal(),
      ],
    );

    return SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: context.colorScheme.surfaceContainerHigh,
        child: tile,
      ),
    );
  }
}
