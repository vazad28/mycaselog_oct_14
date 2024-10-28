// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../app/services/services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dialogServiceHash() => r'21511fc3836f57379a298b22021a124e6215cef2';

/// Riverpod provider to use the dialog service
///
/// Copied from [dialogService].
@ProviderFor(dialogService)
final dialogServiceProvider = Provider<DialogService>.internal(
  dialogService,
  name: r'dialogServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dialogServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DialogServiceRef = ProviderRef<DialogService>;
String _$localStorageHash() => r'6a8a2e8f5ba40d7b896a3d1b5d6b3288cd54b858';

/// Riverpod provider to use the dialog service
///
/// Copied from [localStorage].
@ProviderFor(localStorage)
final localStorageProvider = AutoDisposeProvider<LocalStorage>.internal(
  localStorage,
  name: r'localStorageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalStorageRef = AutoDisposeProviderRef<LocalStorage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
