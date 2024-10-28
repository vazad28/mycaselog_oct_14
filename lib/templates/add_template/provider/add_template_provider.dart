import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../../../app/providers/providers.dart';
import '../../../router/router.dart';

part '../../../generated/templates/add_template/provider/add_template_provider.g.dart';
part 'add_template_fields_provider.dart';
part 'add_template_form_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateSeeder extends _$AddTemplateSeeder {
  @override
  TemplateModel? build() => null;

  /// called by view with passed param caseID to load case model
  void seed(String templateID, String userSpeciality) {
    final templateModel = ref
        .watch(collectionsProvider)
        .templatesCollection
        .getSingle(templateID);

    final model = templateModel ?? TemplateModelX.zero()
      ..speciality = userSpeciality;
    state = model;
  }

  void seedWithImportedTemplate(TemplateModel templateModel) {
    state = templateModel;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addTemplateFormGroup(
  Ref ref,
) {
  final templateModel = ref.watch(addTemplateSeederProvider);

  return FormGroup({
    TemplateModelProps.title.name: FormControl<String>(
      value: templateModel?.title,
      validators: [Validators.required, Validators.minLength(3)],
    ),
    TemplateModelProps.desc.name:
        FormControl<String>(value: templateModel?.desc),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateNotifier extends _$AddTemplateNotifier
    with FormProviderMixin<TemplateModel> {
  @override
  StateOf<TemplateModel> build() => const StateOf<TemplateModel>.init();

  @override
  FormGroup get formGroup => ref.watch(addTemplateFormGroupProvider);

  @override
  TemplateModel? get originalModel => ref.watch(addTemplateSeederProvider);

  @override
  Map<String, dynamic> get originalModelJson => originalModel?.toJson() ?? {};

  @override
  bool canPop() {
    return TemplateModelEquatable.fromJson(originalModelJson) ==
        TemplateModelEquatable.fromJson(createModelToSave().toJson());
  }

  /// Update our model from formdata
  @override
  TemplateModel createModelToSave() {
    final model = TemplateModelX.fromJson(mergedFormData);

    model.fields.clear();

    model.fields.addAll(
      ref.read(addTemplateFieldsNotifierProvider).toList(),
    );

    return model;
  }

  @override
  Future<void> submitForm() async {
    /// validate forms and proceed only if forms are valid
    if (!validateForms()) return Future<void>.sync(() => null);

    try {
      formSubmitAttempted = true;
      state = const StateOf<TemplateModel>.loading();

      /// everything checks out
      final modelToSubmit = createModelToSave();

      // if (modelToSubmit == null) {
      //   state = StateOf<TemplateModel>.failure(Exception('Missing data'));
      //   return;
      // }

      await ref
          .watch(collectionsProvider)
          .templatesCollection
          .add(modelToSubmit);

      state = StateOf<TemplateModel>.success(modelToSubmit);
    } catch (err) {
      state = StateOf<TemplateModel>.failure(Exception(err));
    }
  }

  //void upsertField(TemplateFieldModel? data) {}
}
