// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../cases/provider/cases_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseTileStyleHash() => r'3b18bf56a3581bcaff4cc27f4763ccd9eec16ebd';

/// case tile style provider
///
/// Copied from [CaseTileStyle].
@ProviderFor(CaseTileStyle)
final caseTileStyleProvider =
    AutoDisposeNotifierProvider<CaseTileStyle, int>.internal(
  CaseTileStyle.new,
  name: r'caseTileStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseTileStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseTileStyle = AutoDisposeNotifier<int>;
String _$casesNotifierHash() => r'dee0634e1093b5518a46a3cada56aaee58be5e5d';

/// Cases  stream  provider
///
/// Copied from [CasesNotifier].
@ProviderFor(CasesNotifier)
final casesNotifierProvider = StreamNotifierProvider<CasesNotifier,
    RealmResultsChanges<CaseModel>>.internal(
  CasesNotifier.new,
  name: r'casesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$casesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CasesNotifier = StreamNotifier<RealmResultsChanges<CaseModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
