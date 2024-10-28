import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui/ui.dart';

import '../add_field.dart';
import 'field_options_view.dart';

class AddFieldForm extends ConsumerWidget {
  const AddFieldForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = ref.watch(addFieldFormGroupProvider);

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          const VerticalSpacer.normal(),

          /// Field type selector
          FieldTypeSelectorWidget().formFieldPadding(),

          /// Field title textfield
          ReactiveTextField<String>(
            formControlName: TemplateFieldModelProps.title.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: TemplateFieldModelProps.title.name.titleCase,
                hintText: 'Title of the field',),
          ).formFieldPadding(),

          /// suffix field
          ReactiveTextField<String>(
            formControlName: TemplateFieldModelProps.suffixText.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: TemplateFieldModelProps.suffixText.name,
              hintText: 'Units of data such as - cm, gm',
            ),
          ).formFieldPadding(),

          /// is required field
          ReactiveDropdownField<bool>(
            formControlName: TemplateFieldModelProps.isRequired.name,
            decoration: InputDecoration(
              labelText: TemplateFieldModelProps.isRequired.name,
            ),
            items: [true, false]
                .map(
                  (grade) => DropdownMenuItem<bool>(
                    value: grade,
                    child: Text(grade.toString().titleCase),
                  ),
                )
                .toList(),
          ).formFieldPadding(),

          /// default value field
          const DefaultValueField().formFieldPadding(),

          /// spacer
          const VerticalSpacer.normal(),

          /// fields list
          const Expanded(
            child: FieldOptionsView(),
          ),
        ],
      ),
    );
  }
}
