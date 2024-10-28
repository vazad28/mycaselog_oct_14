// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../add_case/provider/add_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addCaseSeederHash() => r'3d7c7249244b29055d36e63d629cd4a9c0c97915';

/// ////////////////////////////////////////////////////////////////////
///  seeder
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddCaseSeeder].
@ProviderFor(AddCaseSeeder)
final addCaseSeederProvider =
    AutoDisposeNotifierProvider<AddCaseSeeder, AsyncValue<CaseModel>>.internal(
  AddCaseSeeder.new,
  name: r'addCaseSeederProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addCaseSeederHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddCaseSeeder = AutoDisposeNotifier<AsyncValue<CaseModel>>;
String _$currentCaseTemplateHash() =>
    r'38402a80726561dfd6c09c86e97280773c851a72';

/// See also [CurrentCaseTemplate].
@ProviderFor(CurrentCaseTemplate)
final currentCaseTemplateProvider =
    AutoDisposeNotifierProvider<CurrentCaseTemplate, TemplateModel?>.internal(
  CurrentCaseTemplate.new,
  name: r'currentCaseTemplateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCaseTemplateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCaseTemplate = AutoDisposeNotifier<TemplateModel?>;
String _$addCaseNotifierHash() => r'e5c69e86c39405ccc7cd84cf44853f119e2a2df5';

/// ////////////////////////////////////////////////////////////////////
/// Main provider of the  feature
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [AddCaseNotifier].
@ProviderFor(AddCaseNotifier)
final addCaseNotifierProvider =
    AutoDisposeNotifierProvider<AddCaseNotifier, StateOf<CaseModel>>.internal(
  AddCaseNotifier.new,
  name: r'addCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddCaseNotifier = AutoDisposeNotifier<StateOf<CaseModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
