// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../notes/add_note/provider/add_note_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteControllerHash() => r'e6c1c46627b5bfe210e42a7fb9f4756e492970df';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddNoteFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addNoteSeederHash() => r'38a87bf2239b50c1f14125be8971246c9a3502bb';

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
String _$addNoteNotifierHash() => r'cb710cd048b24818e42668b1cd7bb912178864df';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
