// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../case_pdf/provider/case_pdf_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$casePdfNotifierHash() => r'847755cb215d36969449964d9b4546fb6129ac62';

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

abstract class _$CasePdfNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<CasePdfModel>> {
  late final String caseID;
  late final ThemeData themeData;

  AsyncValue<CasePdfModel> build(
    String caseID,
    ThemeData themeData,
  );
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [CasePdfNotifier].
@ProviderFor(CasePdfNotifier)
const casePdfNotifierProvider = CasePdfNotifierFamily();

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [CasePdfNotifier].
class CasePdfNotifierFamily extends Family<AsyncValue<CasePdfModel>> {
  /// ////////////////////////////////////////////////////////////////////
  /// Main Provider
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [CasePdfNotifier].
  const CasePdfNotifierFamily();

  /// ////////////////////////////////////////////////////////////////////
  /// Main Provider
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [CasePdfNotifier].
  CasePdfNotifierProvider call(
    String caseID,
    ThemeData themeData,
  ) {
    return CasePdfNotifierProvider(
      caseID,
      themeData,
    );
  }

  @override
  CasePdfNotifierProvider getProviderOverride(
    covariant CasePdfNotifierProvider provider,
  ) {
    return call(
      provider.caseID,
      provider.themeData,
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
  String? get name => r'casePdfNotifierProvider';
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
///
/// Copied from [CasePdfNotifier].
class CasePdfNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CasePdfNotifier, AsyncValue<CasePdfModel>> {
  /// ////////////////////////////////////////////////////////////////////
  /// Main Provider
  /// ////////////////////////////////////////////////////////////////////
  ///
  /// Copied from [CasePdfNotifier].
  CasePdfNotifierProvider(
    String caseID,
    ThemeData themeData,
  ) : this._internal(
          () => CasePdfNotifier()
            ..caseID = caseID
            ..themeData = themeData,
          from: casePdfNotifierProvider,
          name: r'casePdfNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$casePdfNotifierHash,
          dependencies: CasePdfNotifierFamily._dependencies,
          allTransitiveDependencies:
              CasePdfNotifierFamily._allTransitiveDependencies,
          caseID: caseID,
          themeData: themeData,
        );

  CasePdfNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseID,
    required this.themeData,
  }) : super.internal();

  final String caseID;
  final ThemeData themeData;

  @override
  AsyncValue<CasePdfModel> runNotifierBuild(
    covariant CasePdfNotifier notifier,
  ) {
    return notifier.build(
      caseID,
      themeData,
    );
  }

  @override
  Override overrideWith(CasePdfNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CasePdfNotifierProvider._internal(
        () => create()
          ..caseID = caseID
          ..themeData = themeData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseID: caseID,
        themeData: themeData,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CasePdfNotifier, AsyncValue<CasePdfModel>>
      createElement() {
    return _CasePdfNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CasePdfNotifierProvider &&
        other.caseID == caseID &&
        other.themeData == themeData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseID.hashCode);
    hash = _SystemHash.combine(hash, themeData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CasePdfNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<CasePdfModel>> {
  /// The parameter `caseID` of this provider.
  String get caseID;

  /// The parameter `themeData` of this provider.
  ThemeData get themeData;
}

class _CasePdfNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CasePdfNotifier,
        AsyncValue<CasePdfModel>> with CasePdfNotifierRef {
  _CasePdfNotifierProviderElement(super.provider);

  @override
  String get caseID => (origin as CasePdfNotifierProvider).caseID;
  @override
  ThemeData get themeData => (origin as CasePdfNotifierProvider).themeData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
