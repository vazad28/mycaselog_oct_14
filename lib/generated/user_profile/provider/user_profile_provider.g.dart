// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../user_profile/provider/user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userMiniStatsHash() => r'6b9ce9dddcf62a2d0ae5abaa3ee958ba131db37d';

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
    r'916bd3447cf95c770e0659ae1874b9a08ee01f03';

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
