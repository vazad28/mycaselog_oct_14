// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../user_profile/provider/user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userMiniStatsHash() => r'ec65894716f1266cb4cf5d88127152e8054044c8';

/// See also [userMiniStats].
@ProviderFor(userMiniStats)
final userMiniStatsProvider = AutoDisposeProvider<UserStatsModel>.internal(
  userMiniStats,
  name: r'userMiniStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userMiniStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserMiniStatsRef = AutoDisposeProviderRef<UserStatsModel>;
String _$userProfileNotifierHash() =>
    r'31f0cffa3dc9bdf93ccd2193feab3d4dbc1c6ee9';

/// ////////////////////////////////////////////////////////////////////
/// Main Providers
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [UserProfileNotifier].
@ProviderFor(UserProfileNotifier)
final userProfileNotifierProvider =
    AutoDisposeNotifierProvider<UserProfileNotifier, UserModel>.internal(
  UserProfileNotifier.new,
  name: r'userProfileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserProfileNotifier = AutoDisposeNotifier<UserModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
