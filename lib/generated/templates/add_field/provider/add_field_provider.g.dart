// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../templates/add_field/provider/add_field_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addFieldFormGroupHash() => r'0d5c078ace0e3cc8a3819df9117a749e3a4da954';

/// ////////////////////////////////////////////////////////////////////
/// Form  Group Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [addFieldFormGroup].
@ProviderFor(addFieldFormGroup)
final addFieldFormGroupProvider = AutoDisposeProvider<FormGroup>.internal(
  addFieldFormGroup,
  name: r'addFieldFormGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addFieldFormGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddFieldFormGroupRef = AutoDisposeProviderRef<FormGroup>;
String _$addFieldSeederHash() => r'5fc981839f4348f3cc9b8e9fc31790960d20b1aa';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddFieldSeeder].
@ProviderFor(AddFieldSeeder)
final addFieldSeederProvider =
    AutoDisposeNotifierProvider<AddFieldSeeder, TemplateFieldModel?>.internal(
  AddFieldSeeder.new,
  name: r'addFieldSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addFieldSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddFieldSeeder = AutoDisposeNotifier<TemplateFieldModel?>;
String _$addFieldNotifierHash() => r'8dc3496ac14b77a06b522a92d7d66e4567359555';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddFieldNotifier].
@ProviderFor(AddFieldNotifier)
final addFieldNotifierProvider = AutoDisposeNotifierProvider<AddFieldNotifier,
    StateOf<TemplateFieldModel>>.internal(
  AddFieldNotifier.new,
  name: r'addFieldNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addFieldNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddFieldNotifier = AutoDisposeNotifier<StateOf<TemplateFieldModel>>;
String _$templateFieldTypeHash() => r'b505eecb4b93de1b78f201e53243c0e6cb614df6';

/// field type provider
///
/// Copied from [TemplateFieldType].
@ProviderFor(TemplateFieldType)
final templateFieldTypeProvider =
    AutoDisposeNotifierProvider<TemplateFieldType, FieldType>.internal(
  TemplateFieldType.new,
  name: r'templateFieldTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templateFieldTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplateFieldType = AutoDisposeNotifier<FieldType>;
String _$templateFieldOptionsHash() =>
    r'9ff1efb10ac330255c92c774b80b917d440bda9d';

/// Add field options provider
///
/// Copied from [TemplateFieldOptions].
@ProviderFor(TemplateFieldOptions)
final templateFieldOptionsProvider = AutoDisposeNotifierProvider<
    TemplateFieldOptions, Iterable<String>?>.internal(
  TemplateFieldOptions.new,
  name: r'templateFieldOptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templateFieldOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemplateFieldOptions = AutoDisposeNotifier<Iterable<String>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
