// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_timeline/provider/case_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseTimelineNotifierHash() =>
    r'c2da83e2311040ee78a4d268aab123e96a803ec5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CaseTimelineNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<TimelineItemModel>>> {
  late final String caseID;

  AsyncValue<List<TimelineItemModel>> build(
    String caseID,
  );
}

/// See also [CaseTimelineNotifier].
@ProviderFor(CaseTimelineNotifier)
const caseTimelineNotifierProvider = CaseTimelineNotifierFamily();

/// See also [CaseTimelineNotifier].
class CaseTimelineNotifierFamily
    extends Family<AsyncValue<List<TimelineItemModel>>> {
  /// See also [CaseTimelineNotifier].
  const CaseTimelineNotifierFamily();

  /// See also [CaseTimelineNotifier].
  CaseTimelineNotifierProvider call(
    String caseID,
  ) {
    return CaseTimelineNotifierProvider(
      caseID,
    );
  }

  @override
  CaseTimelineNotifierProvider getProviderOverride(
    covariant CaseTimelineNotifierProvider provider,
  ) {
    return call(
      provider.caseID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'caseTimelineNotifierProvider';
}

/// See also [CaseTimelineNotifier].
class CaseTimelineNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CaseTimelineNotifier, AsyncValue<List<TimelineItemModel>>> {
  /// See also [CaseTimelineNotifier].
  CaseTimelineNotifierProvider(
    String caseID,
  ) : this._internal(
          () => CaseTimelineNotifier()..caseID = caseID,
          from: caseTimelineNotifierProvider,
          name: r'caseTimelineNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$caseTimelineNotifierHash,
          dependencies: CaseTimelineNotifierFamily._dependencies,
          allTransitiveDependencies:
              CaseTimelineNotifierFamily._allTransitiveDependencies,
          caseID: caseID,
        );

  CaseTimelineNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseID,
  }) : super.internal();

  final String caseID;

  @override
  AsyncValue<List<TimelineItemModel>> runNotifierBuild(
    covariant CaseTimelineNotifier notifier,
  ) {
    return notifier.build(
      caseID,
    );
  }

  @override
  Override overrideWith(CaseTimelineNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CaseTimelineNotifierProvider._internal(
        () => create()..caseID = caseID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseID: caseID,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CaseTimelineNotifier,
      AsyncValue<List<TimelineItemModel>>> createElement() {
    return _CaseTimelineNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CaseTimelineNotifierProvider && other.caseID == caseID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CaseTimelineNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<List<TimelineItemModel>>> {
  /// The parameter `caseID` of this provider.
  String get caseID;
}

class _CaseTimelineNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CaseTimelineNotifier,
        AsyncValue<List<TimelineItemModel>>> with CaseTimelineNotifierRef {
  _CaseTimelineNotifierProviderElement(super.provider);

  @override
  String get caseID => (origin as CaseTimelineNotifierProvider).caseID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
