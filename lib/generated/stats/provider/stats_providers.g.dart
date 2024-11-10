// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../stats/provider/stats_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chartTabsControllerHash() =>
    r'508054605f47f45815675cff5a4dfdea11f7a417';

/// Page controller provider
///
/// Copied from [chartTabsController].
@ProviderFor(chartTabsController)
final chartTabsControllerProvider =
    AutoDisposeProvider<PageController>.internal(
  chartTabsController,
  name: r'chartTabsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chartTabsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChartTabsControllerRef = AutoDisposeProviderRef<PageController>;
String _$touchedIndexHash() => r'c31bebe74756143799c4b36d906c57d15c82d25c';

/// Provider holding current touched chart items index
///
/// Copied from [TouchedIndex].
@ProviderFor(TouchedIndex)
final touchedIndexProvider =
    AutoDisposeNotifierProvider<TouchedIndex, int?>.internal(
  TouchedIndex.new,
  name: r'touchedIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$touchedIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TouchedIndex = AutoDisposeNotifier<int?>;
String _$statsDataHash() => r'd84caae9c6378a25387e82da0f375128c643918e';

/// See also [StatsData].
@ProviderFor(StatsData)
final statsDataProvider =
    AutoDisposeNotifierProvider<StatsData, StateOf<ChartDataModel>>.internal(
  StatsData.new,
  name: r'statsDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$statsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StatsData = AutoDisposeNotifier<StateOf<ChartDataModel>>;
String _$statsNotifierHash() => r'e712aa25c8ec295ba65146cce50bfb0e317d172e';

/// See also [StatsNotifier].
@ProviderFor(StatsNotifier)
final statsNotifierProvider =
    AutoDisposeNotifierProvider<StatsNotifier, ChartReqModel>.internal(
  StatsNotifier.new,
  name: r'statsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$statsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StatsNotifier = AutoDisposeNotifier<ChartReqModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
