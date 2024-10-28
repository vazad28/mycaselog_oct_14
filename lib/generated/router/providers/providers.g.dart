// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/providers/providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shellRoutesObserversHash() =>
    r'65b504f2eb3a24d99cd27c834de218440a3c94ef';

/// Important to keep alive else a new instance of the observer is creared
/// and the didPop will not be called on route aware pages
///
/// Copied from [shellRoutesObservers].
@ProviderFor(shellRoutesObservers)
final shellRoutesObserversProvider = Provider<RoutesObservers>.internal(
  shellRoutesObservers,
  name: r'shellRoutesObserversProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shellRoutesObserversHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShellRoutesObserversRef = ProviderRef<RoutesObservers>;
String _$rootNavDestinationsHash() =>
    r'dc865d50aa1812f73a493812961646befaa1f387';

/// See also [rootNavDestinations].
@ProviderFor(rootNavDestinations)
final rootNavDestinationsProvider =
    Provider<List<NavigationDestination>>.internal(
  rootNavDestinations,
  name: r'rootNavDestinationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rootNavDestinationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RootNavDestinationsRef = ProviderRef<List<NavigationDestination>>;
String _$routesHash() => r'169979c2807a291e64a854839b8f9f3b8b6f1878';

/// Routes Provider
///
/// Copied from [routes].
@ProviderFor(routes)
final routesProvider = Provider<List<RouteBase>>.internal(
  routes,
  name: r'routesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RoutesRef = ProviderRef<List<RouteBase>>;
String _$appRouterHash() => r'f6179db77f45e4d2f87ea9393fad6452b37feced';

/// A state provider holding the state for the visibility of the
/// bottom navigation bar
///
/// Copied from [AppRouter].
@ProviderFor(AppRouter)
final appRouterProvider = NotifierProvider<AppRouter, GoRouter>.internal(
  AppRouter.new,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppRouter = Notifier<GoRouter>;
String _$bottomNavVisibilityHash() =>
    r'd6833f46d8ff2aa10a1b76d6bdadb033870e7064';

/// A state provider holding the state for the visibility of the
/// bottom navigation bar
///
/// Copied from [BottomNavVisibility].
@ProviderFor(BottomNavVisibility)
final bottomNavVisibilityProvider =
    NotifierProvider<BottomNavVisibility, bool>.internal(
  BottomNavVisibility.new,
  name: r'bottomNavVisibilityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bottomNavVisibilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BottomNavVisibility = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
