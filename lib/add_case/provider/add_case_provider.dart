import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

import '../../app/app.dart';
import '../../router/router.dart';
import '../forms/forms_provider.dart';

part '../../generated/add_case/provider/add_case_provider.g.dart';
part 'add_case_form_mixin.dart';

/// form validate failure basic data tab
class BasicTabFormValidationError implements Exception {}

/// form validate failure template data tab
class TemplateTabFormValidationError implements Exception {}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddCaseSeeder extends _$AddCaseSeeder {
  @override
  AsyncValue<CaseModel> build() {
    return const AsyncValue.loading();
  }

  void seed(String caseID) {
    if (caseID == 'new') {
      state = AsyncValue.data(CaseModelX.zero());
      return;
    }
    final caseModel = ref.watch(dbProvider).casesCollection.getSingle(caseID);

    if (caseModel == null) {
      state = AsyncValue.error('No case', StackTrace.current);
    } else {
      state = AsyncValue.data(caseModel);
    }
  }
}

@riverpod
class CurrentCaseTemplate extends _$CurrentCaseTemplate {
  @override
  TemplateModel? build() {
    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    if (caseModel.templateID == null) return null;

    return ref
        .watch(dbProvider)
        .templatesCollection
        .getSingle(caseModel.templateID!);
  }

  void onTemplateChange(TemplateModel templateModel) {
    state = templateModel;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddCaseNotifier extends _$AddCaseNotifier {
  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  bool _formSubmitAttempted = false;

  /// Form Group instance
  FormGroup get _patientDataForm => ref.read(patientDataFormGroupProvider);
  FormGroup get _basicDataForm => ref.read(basicDataFormGroupProvider);
  FormGroup get _templatedDataForm => ref.read(templatedDataFormGroupProvider);

  CaseModel? get originalModel => ref.watch(addCaseSeederProvider).requireValue;

  Map<String, dynamic> get originalModelJson => originalModel?.toJson() ?? {};

  /// Validate the form data
  bool _validateForms() {
    if (_patientDataForm.invalid || _basicDataForm.invalid) {
      _patientDataForm.markAllAsTouched();
      _basicDataForm.markAllAsTouched();
      state = StateOf<CaseModel>.failure(BasicTabFormValidationError());
      return false;
    }

    if (_templatedDataForm.invalid) {
      _templatedDataForm.markAllAsTouched();
      state = StateOf<CaseModel>.failure(TemplateTabFormValidationError());
      return false;
    }

    return true;
  }

  /// get the fields of the current template and to each fields update its values
  /// with  the current forms data
  List<TemplateFieldModel>? _createFieldsData(
    TemplateModel? currTemplateModel,
  ) {
    return currTemplateModel?.fields.map((templateField) {
      return templateField.toUnmanaged()
        ..value = _templatedDataForm.value[templateField.slug] as String?;
    }).toList();
  }

  CaseModel? createModelToSave() {
    /// update with basic data
    final caseModelJson = {...originalModelJson, ..._basicDataForm.value};

    final currTemplateModel = ref.read(currentCaseTemplateProvider);

    final createdModel = CaseModelX.fromJson(caseModelJson)
      ..patientModel = PatientModelX.fromJson(_patientDataForm.value)
      ..templateID = currTemplateModel?.templateID;

    createdModel.fieldsData.clear();
    createdModel.fieldsData.addAll(_createFieldsData(currTemplateModel) ?? []);

    return createdModel;
  }

  /// bool canPop()
  bool canPop() {
    if (_formSubmitAttempted) return true;
    try {
      /// Create model instance with form data
      final formToModel = createModelToSave();
      if (formToModel == null) return true;

      final formModelEquatable =
          CaseModelEquatable.fromJson(formToModel.toJson());

      final originalModelEquatable =
          CaseModelEquatable.fromJson(originalModelJson);

      return originalModelEquatable == formModelEquatable;
    } catch (err) {
      return false;
    }
  }

  Future<void> submitForm() async {
    try {
      _formSubmitAttempted = true;
      state = const StateOf<CaseModel>.loading();

      /// validate forms and proceed only if forms are valid
      if (!_validateForms()) return;

      /// everything checks out
      final modelToSubmit = createModelToSave();

      if (modelToSubmit == null) {
        state = StateOf<CaseModel>.failure(Exception('Missing data'));
        return;
      }

      /// UPSERT the case to the database
      await ref.watch(dbProvider).casesCollection.add(modelToSubmit);

      /// set last used location as default location to use next time
      if (modelToSubmit.location != null) {
        ref
            .read(localStorageProvider)
            .setDefaultSurgeryLocation(modelToSubmit.location!);
      }

      state = StateOf<CaseModel>.success(modelToSubmit);
    } catch (err) {
      state = StateOf<CaseModel>.failure(Exception(err));
    }
  }
}
