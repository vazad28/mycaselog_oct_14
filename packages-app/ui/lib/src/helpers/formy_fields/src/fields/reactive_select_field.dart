import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../dialogs/dialogs.dart';
import '../../../radio_delect/radio_select.dart';

class ReactiveSelectField extends ReactiveFormField<String, List<String>> {
  ReactiveSelectField({
    required String title,
    required InputDecoration decoration,
    required List<RadioSelectOption<String>> items,
    ControlValueAccessor<String, List<String>>? valueAccessor,
    super.key,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.showErrors,
    Widget? subTitle,
    bool allowAdd = false,
    Icon? suffixIcon,
    double disabledOpacity = 0.5,
  }) : super(
          valueAccessor: valueAccessor ??= SelectValueAccessor(),
          builder: (field) {
            final isEmptyValue = field.value?.isEmpty ?? true;

            return IgnorePointer(
              ignoring: !field.control.enabled,
              child: Opacity(
                opacity: field.control.enabled ? 1 : disabledOpacity,
                child: GestureDetector(
                  onTap: () async {
                    //if (items.isEmpty) return;

                    field.control
                      ..focus()
                      ..updateValueAndValidity();

                    final value = field.control.value;

                    final newValue =
                        await field.context.openModalPage<List<String>>(
                      child: MultiSelectModal<String>(
                        items: items,
                        title: title,
                        subTitle: subTitle,
                        allowAdd: allowAdd,
                        selectedValues: valueAccessor!.modelToViewValue(value),
                      ),
                    );

                    if (newValue != null) field.didChange(newValue);

                    field.control
                      ..unfocus()
                      ..updateValueAndValidity()
                      ..markAsTouched();
                  },
                  child: InputDecorator(
                    decoration: decoration.copyWith(
                      errorText: field.errorText,
                      enabled: field.control.enabled,
                      suffixIcon: suffixIcon ?? const Icon(Icons.unfold_more),
                    ),
                    //isFocused: field.control.hasFocus,
                    isEmpty: isEmptyValue,
                    child: Text(
                      field.value?.map((e) => e.titleCase).join(',') ?? '',
                      style: Theme.of(field.context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            );
          },
        );
}

/// Represents a control value accessor that convert between data types
/// [String] and [bool].
class SelectValueAccessor extends ControlValueAccessor<String, List<String>> {
  @override
  List<String>? modelToViewValue(String? modelValue) {
    return modelValue?.split(',');
  }

  @override
  String? viewToModelValue(List<String>? viewValue) {
    return viewValue?.join(',');
  }
}
