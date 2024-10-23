// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/add_template/provider/add_template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTemplateFormGroupHash() =>
    r'9ce617db6d48d9c68b5a2b7ffaa7799cf3a9b05d';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addTemplateFormGroup].
@ProviderFor(addTemplateFormGroup)
final addTemplateFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  addTemplateFormGroup,
  name: r'addTemplateFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddTemplateFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addTemplateSeederHash() => r'bcfefd163a41bd56770d644f1c71ab4bb71c4743';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateSeeder].
@ProviderFor(AddTemplateSeeder)
final addTemplateSeederProvider =
    AutoDisposeNotifierProvider<AddTemplateSeeder, TemplateModel?>.internal(
  AddTemplateSeeder.new,
  name: r'addTemplateSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateSeeder = AutoDisposeNotifier<TemplateModel?>;
String _$addTemplateNotifierHash() =>
    r'f50ffa1fae8868b5dca39fc96df3cd2264508a7c';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateNotifier].
@ProviderFor(AddTemplateNotifier)
final addTemplateNotifierProvider = AutoDisposeNotifierProvider<
    AddTemplateNotifier, StateOf<TemplateModel>>.internal(
  AddTemplateNotifier.new,
  name: r'addTemplateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateNotifier = AutoDisposeNotifier<StateOf<TemplateModel>>;
String _$addTemplateFieldsNotifierHash() =>
    r'b61a08f14e1247ae295658177a406ba385f23b72';

/// ////////////////////////////////////////////////////////////////////
/// Main provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddTemplateFieldsNotifier].
@ProviderFor(AddTemplateFieldsNotifier)
final addTemplateFieldsNotifierProvider = AutoDisposeNotifierProvider<
    AddTemplateFieldsNotifier, List<TemplateFieldModel>>.internal(
  AddTemplateFieldsNotifier.new,
  name: r'addTemplateFieldsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTemplateFieldsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTemplateFieldsNotifier
    = AutoDisposeNotifier<List<TemplateFieldModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
