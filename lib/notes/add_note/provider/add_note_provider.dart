import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../../../app/app.dart';
import '../../../router/router.dart';

part '../../../generated/notes/add_note/provider/add_note_provider.g.dart';
part 'add_note_form_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Note editor controller instance
/// ////////////////////////////////////////////////////////////////////
@riverpod
QuillController noteController(Ref ref) {
  return QuillController.basic();
}

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddNoteSeeder extends _$AddNoteSeeder {
  @override
  NoteModel? build() => null;

  /// called by view with passed param caseID to load case model
  Future<void> seed(String noteID) async {
    final noteModel =
        ref.watch(collectionsProvider).notesCollection.getSingle(noteID);

    final model = noteModel ?? NoteModelX.zero();

    originalModelJson = model.toJson();

    /// update the note controller value for the note quill editor
    ref.watch(noteControllerProvider).document = model.quillDocument;

    state = model;
  }

  late final Map<String, dynamic> originalModelJson;
}

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
FormGroup addNoteFormGroup(AddNoteFormGroupRef ref) {
  final noteModel = ref.watch(addNoteSeederProvider);

  if (noteModel == null) return FormGroup({});

  return FormGroup({
    NoteModelProps.title.name: FormControl<String>(
      value: noteModel.title,
      validators: [Validators.required],
    ),
    NoteModelProps.note.name: FormControl<String>(
      value: noteModel.note,
    ),
  });
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddNoteNotifier extends _$AddNoteNotifier
    with FormProviderMixin<NoteModel> {
  @override
  StateOf<NoteModel> build() {
    return const StateOf<NoteModel>.init();
  }

  @override
  FormGroup get formGroup => ref.watch(addNoteFormGroupProvider);

  @override
  NoteModel? get originalModel => ref.watch(addNoteSeederProvider);

  @override
  Map<String, dynamic> get originalModelJson => originalModel?.toJson() ?? {};

  @override
  bool canPop() {
    return NoteModelEquatable.fromJson(originalModelJson) ==
        NoteModelEquatable.fromJson(createModelToSave().toJson());
  }

  /// Update our model from formdata
  @override
  NoteModel createModelToSave() {
    final model = NoteModelX.fromJson(mergedFormData)
      ..note = ref.read(noteControllerProvider).document.toJsonString;

    return model;
  }

  @override
  Future<void> submitForm() async {
    try {
      formSubmitAttempted = true;

      /// validate forms and proceed only if forms are valid
      if (!validateForms()) return;

      state = const StateOf<NoteModel>.loading();

      /// everything checks out
      final modelToSubmit = createModelToSave();

      await ref.watch(collectionsProvider).notesCollection.add(modelToSubmit);

      state = StateOf<NoteModel>.success(modelToSubmit);
    } catch (err) {
      state = StateOf<NoteModel>.failure(Exception(err));
    }
  }
}
