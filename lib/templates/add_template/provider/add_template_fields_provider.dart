part of 'add_template_provider.dart';

mixin AddTemplateFieldsMixin {
  void addUpdateField(WidgetRef ref, TemplateFieldModel? data) =>
      ref.watch(addTemplateFieldsNotifierProvider.notifier).upsertField(data);

  void reOrderFields(WidgetRef ref, List<TemplateFieldModel> list) =>
      ref.watch(addTemplateFieldsNotifierProvider.notifier).reOrderFields(list);

  void importFields(WidgetRef ref, TemplateModel templateModel) => ref
      .watch(addTemplateFieldsNotifierProvider.notifier)
      .importFields(templateModel);

  List<TemplateFieldModel>? templateFieldsListState(WidgetRef ref) =>
      ref.watch(addTemplateFieldsNotifierProvider);
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateFieldsNotifier extends _$AddTemplateFieldsNotifier {
  @override
  List<TemplateFieldModel> build() {
    final templateModel = ref.watch(addTemplateSeederProvider);

    return templateModel?.fields ?? [];
  }

  void reOrderFields(List<TemplateFieldModel> list) {
    final fields = List<TemplateFieldModel>.from(list);
    for (var i = 0; i < fields.length; i++) {
      fields[i] = fields[i]..idx = i;
    }
    state = fields;
  }

  void importFields(TemplateModel templateModel) {
    if (templateModel.fields.isEmpty) return;
    reOrderFields(templateModel.fields);
  }

  void upsertField(TemplateFieldModel? newField) {
    if (newField == null) return;

    final fields = List<TemplateFieldModel>.from(state);
    final index =
        fields.indexWhere((element) => element.fieldID == newField.fieldID);

    if (index >= 0) {
      fields[index] = newField;
      state = fields;
    } else {
      fields.add(newField);
      state = fields;
    }
  }
}
