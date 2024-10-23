part of 'add_field_provider.dart';

/// field type provider
@riverpod
class TemplateFieldType extends _$TemplateFieldType {
  @override
  FieldType build() {
    final templateFieldModel = ref.watch(addFieldSeederProvider);
    return templateFieldModel?.fieldType ?? FieldType.text;
  }

  // ignore: use_setters_to_change_properties
  void update(FieldType newType) => state = newType;
}

/// Add field options provider
@riverpod
class TemplateFieldOptions extends _$TemplateFieldOptions {
  @override
  Iterable<String>? build() {
    return ref.watch(addFieldSeederProvider)?.options;
  }

  /// method to update field options
  void updateFieldOption(String option) {
    final fieldOptions = List<String>.from(state ?? <String>[]);

    final index = fieldOptions.indexOf(option);
    index == -1 ? fieldOptions.add(option) : fieldOptions[index] = option;

    state = fieldOptions;
  }

  void removeFieldOption(String value) {
    if (state?.isEmpty ?? true) return;
    state = List<String>.from(state!)
      ..removeWhere((element) => element.toLowerCase() == value.toLowerCase());
  }
}
