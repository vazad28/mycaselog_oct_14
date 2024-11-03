// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../add_case/provider/add_case_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addCaseSeederHash() => r'8902c60ebf576a0837ca012cc0cd342bfcd9d15c';

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
    r'6e3426dd3306ed9c9bed5a139cd4d9831059f284';

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
String _$addCaseNotifierHash() => r'26c7c5cb3a13d1ba0603d4d1ca5bee44e0a03e6a';

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
