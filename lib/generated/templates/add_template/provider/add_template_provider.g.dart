// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/add_template/provider/add_template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTemplateFormGroupHash() =>
    r'3ef64aaf2d853c97cc453f6e13d755e2f6879b5b';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddTemplateFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addTemplateSeederHash() => r'0483febbd19de5178cd3c276efd67d28e8a81fa6';

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
    r'73c9d01b97c9f7d0d272a3509206c7e448170d21';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
