// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../shared/services/services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

typedef LocalStorageRef = AutoDisposeProviderRef<LocalStorage>;
String _$dialogServiceHash() => r'33d1fc7bae9b43c98c784b20bc476cfdd8a21ebd';

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

typedef DialogServiceRef = ProviderRef<DialogService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
