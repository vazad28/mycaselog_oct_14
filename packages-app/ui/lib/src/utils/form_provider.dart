import 'dart:async';

import 'package:reactive_forms/reactive_forms.dart';

abstract interface class FormProviderInterface<T> {
  /// get the original caseModel
  T? get originalModel;

  /// Form Group instance
  FormGroup get formGroup;

  /// create json Data from original model
  Map<String, dynamic> get originalModelJson;

  /// Update our model from formdata
  T? createModelToSave();

  /// Method to submit the form
  FutureOr<void> submitForm();
}

mixin FormProviderMixin<T> implements FormProviderInterface<T> {
  bool formSubmitAttempted = false;

  /// Validate the form data
  bool validateForms() {
    if (formGroup.invalid) {
      formGroup.markAllAsTouched();
      return false;
    }
    return true;
  }

  Map<String, dynamic> get mergedFormData =>
      {...originalModelJson, ...formGroup.value};

  /// bool canPop()
  bool canPop() {
    if (formSubmitAttempted) return true;
    try {
      /// Create model instance with form data
      final formToModel = createModelToSave();

      return originalModel == formToModel;
    } catch (err) {
      return false;
    }
  }
}
