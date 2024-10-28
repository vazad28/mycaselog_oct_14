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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserMiniStatsRef = AutoDisposeProviderRef<UserStatsModel>;
String _$signOutButtonNotifierHash() =>
    r'f3935c19e11694e3a5e331ade023cc78bf68ac71';

/// ////////////////////////////////////////////////////////////////////
/// Signout loading spinner provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [SignOutButtonNotifier].
@ProviderFor(SignOutButtonNotifier)
final signOutButtonNotifierProvider =
    AutoDisposeNotifierProvider<SignOutButtonNotifier, bool>.internal(
  SignOutButtonNotifier.new,
  name: r'signOutButtonNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutButtonNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignOutButtonNotifier = AutoDisposeNotifier<bool>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
