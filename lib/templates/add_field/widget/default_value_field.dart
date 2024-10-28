import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui/ui.dart';

import '../add_field.dart';

const _defaultValueHintText = 'default field value';

class DefaultValueField extends ConsumerWidget with AddFieldFormMixin {
  const DefaultValueField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFieldType = ref.watch(templateFieldTypeProvider);

    return switch (currFieldType) {
      FieldType.text => const _DefaultValueFieldText(),
      FieldType.radio => const _DefaultValueFieldRadio(),
      FieldType.select => const _DefaultValueFieldSelect(),
      FieldType.bool => const _DefaultValueBoolField(),
      FieldType.number => const _DefaultValueFieldNumber()
    };
  }
}

class _DefaultValueBoolField extends ConsumerWidget {
  const _DefaultValueBoolField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveDropdownField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      decoration: InputDecoration(
          labelText: TemplateFieldModelProps.defaultValue.name.titleCase,
          hintText: _defaultValueHintText,),
      items: ['true', 'false']
          .map(
            (grade) => DropdownMenuItem<String>(
              value: grade,
              child: Text(grade.titleCase),
            ),
          )
          .toList(),
    );
  }
}

class _DefaultValueFieldRadio extends ConsumerWidget {
  const _DefaultValueFieldRadio();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(templateFieldOptionsProvider) ?? <String>[];

    final items =
        options.map((e) => RadioSelectOption(title: e, value: e)).toList();

    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: TemplateFieldModelProps.defaultValue.name,
        hintText: _defaultValueHintText,
        suffix: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      onTap: (formCtrl) => options.isEmpty
          ? null
          : context
              .openModalPage<String>(
              child: RadioSelectModal(
                items: items,
                title: TemplateFieldModelProps.defaultValue.name,
                selectedValue: formCtrl.value,
              ),
            )
              .then((newValue) {
              if (newValue == null) return;
              formCtrl.value = newValue;
            }),
    );
  }
}

class _DefaultValueFieldSelect extends ConsumerWidget {
  const _DefaultValueFieldSelect();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(templateFieldOptionsProvider) ?? <String>[];

    final items =
        options.map((e) => RadioSelectOption(title: e, value: e)).toList();

    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: TemplateFieldModelProps.defaultValue.name,
        hintText: _defaultValueHintText,
        suffix: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      onTap: (formCtrl) => options.isEmpty
          ? null
          : context
              .openModalPage<List<String>>(
              child: MultiSelectModal(
                items: items,
                title: TemplateFieldModelProps.defaultValue.name,
                selectedValues: formCtrl.value?.split(','),
              ),
            )
              .then((newValue) {
              if (newValue == null) return;
              formCtrl.value = newValue.join(',');
            }),
    );
  }
}

class _DefaultValueFieldText extends ConsumerWidget {
  const _DefaultValueFieldText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: TemplateFieldModelProps.defaultValue.name,
          hintText: _defaultValueHintText,),
    );
  }
}

class _DefaultValueFieldNumber extends ConsumerWidget {
  const _DefaultValueFieldNumber();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: TemplateFieldModelProps.defaultValue.name,
          hintText: _defaultValueHintText,),
    );
  }
}
