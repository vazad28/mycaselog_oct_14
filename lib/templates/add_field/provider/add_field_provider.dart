import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../../../router/router.dart';

part '../../../generated/templates/add_field/provider/add_field_provider.g.dart';
part 'add_field_form_mixin.dart';
part 'field_options_provider.dart';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddFieldSeeder extends _$AddFieldSeeder {
  @override
  TemplateFieldModel? build() => null;

  /// called by view with passed param caseID to load case model
  Future<void> seed(TemplateFieldModel model) async {
    originalModelJson = model.toJson();
    state = model;
  }

  late final Map<String, dynamic> originalModelJson;
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addFieldFormGroup(Ref ref) {
  final templateFieldModel = ref.watch(addFieldSeederProvider);

  return FormGroup({
    TemplateFieldModelProps.title.name: FormControl<String>(
      value: templateFieldModel?.title,
      validators: [Validators.required, Validators.minLength(3)],
    ),
    TemplateFieldModelProps.fieldType.name: FormControl<String>(
      value: templateFieldModel?.fieldType.name,
      validators: [Validators.required],
    ),
    TemplateFieldModelProps.fieldDataType.name: FormControl<String>(
      value: templateFieldModel?.fieldDataType.name,
    ),
    TemplateFieldModelProps.options.name: FormControl<Iterable<String>>(
      value: templateFieldModel?.options,
    ),
    TemplateFieldModelProps.defaultValue.name: FormControl<String>(
      value: templateFieldModel?.defaultValue,
    ),
    TemplateFieldModelProps.suffixText.name: FormControl<String>(
      value: templateFieldModel?.suffixText,
    ),
    TemplateFieldModelProps.isRequired.name: FormControl<bool>(
      value: templateFieldModel?.isRequired,
    ),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddFieldNotifier extends _$AddFieldNotifier
    with FormProviderMixin<TemplateFieldModel> {
  @override
  StateOf<TemplateFieldModel> build() {
    return const StateOf<TemplateFieldModel>.init();
  }

  @override
  TemplateFieldModel createModelToSave() =>
      TemplateFieldModelX.fromJson(mergedFormData);

  @override
  FormGroup get formGroup => ref.watch(addFieldFormGroupProvider);

  @override
  TemplateFieldModel? get originalModel => ref.watch(addFieldSeederProvider);

  @override
  Map<String, dynamic> get originalModelJson =>
      ref.watch(addFieldSeederProvider.notifier).originalModelJson;

  @override
  bool canPop() {
    return TemplateFieldModelEquatable.fromJson(originalModelJson) ==
        TemplateFieldModelEquatable.fromJson(createModelToSave().toJson());
  }

  @override
  Future<void> submitForm() async {
    try {
      formSubmitAttempted = true;
      state = const StateOf<TemplateFieldModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!validateForms()) return;

      /// everything checks out
      final modelToSubmit = createModelToSave();

      state = StateOf<TemplateFieldModel>.success(modelToSubmit);
    } catch (err) {
      state = StateOf<TemplateFieldModel>.failure(Exception(err));
    }
  }
}
