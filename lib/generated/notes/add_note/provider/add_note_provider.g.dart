// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../notes/add_note/provider/add_note_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteControllerHash() => r'831ffe113128ce233d5a9f2db0d1a8ce96bd442b';

/// ////////////////////////////////////////////////////////////////////
/// Note editor controller instance
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [noteController].
@ProviderFor(noteController)
final noteControllerProvider = AutoDisposeProvider<QuillController>.internal(
  noteController,
  name: r'noteControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noteControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NoteControllerRef = AutoDisposeProviderRef<QuillController>;
String _$addNoteFormGroupHash() => r'51696f2ef78f3db8ae72e55dba5cd7372c5fcde5';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addNoteFormGroup].
@ProviderFor(addNoteFormGroup)
final addNoteFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  addNoteFormGroup,
  name: r'addNoteFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNoteFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddNoteFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addNoteSeederHash() => r'6a1e90d05bf43f13bc7923beb39d5c115f416482';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddNoteSeeder].
@ProviderFor(AddNoteSeeder)
final addNoteSeederProvider =
    AutoDisposeNotifierProvider<AddNoteSeeder, NoteModel?>.internal(
  AddNoteSeeder.new,
  name: r'addNoteSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNoteSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddNoteSeeder = AutoDisposeNotifier<NoteModel?>;
String _$addNoteNotifierHash() => r'2f3ab95c4077d2da643cd36045915d718e326bb7';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddNoteNotifier].
@ProviderFor(AddNoteNotifier)
final addNoteNotifierProvider =
    AutoDisposeNotifierProvider<AddNoteNotifier, StateOf<NoteModel>>.internal(
  AddNoteNotifier.new,
  name: r'addNoteNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNoteNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddNoteNotifier = AutoDisposeNotifier<StateOf<NoteModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
