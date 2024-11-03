// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../app/providers/providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageUploadServiceHash() =>
    r'b90e0e27a293abbb65ee2daee83d24382d91b328';

/// Riverpod provider to use the dialog service
///
/// Copied from [imageUploadService].
@ProviderFor(imageUploadService)
final imageUploadServiceProvider = Provider<ImageUploadService>.internal(
  imageUploadService,
  name: r'imageUploadServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageUploadServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImageUploadServiceRef = ProviderRef<ImageUploadService>;
String _$firebaseAuthInstanceHash() =>
    r'fb9c7d658061c097ccd3a054f263026006b911cb';

/// Firebase Auth Instance for use all through the app
///
/// Copied from [firebaseAuthInstance].
@ProviderFor(firebaseAuthInstance)
final firebaseAuthInstanceProvider = Provider<FirebaseAuth>.internal(
  firebaseAuthInstance,
  name: r'firebaseAuthInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthInstanceRef = ProviderRef<FirebaseAuth>;
String _$authenticationClientHash() =>
    r'9f37a2d93d289540f2c4fefdf18fcfc3ff76154c';

/// Firebase Auth Instance for use all through the app
///
/// Copied from [authenticationClient].
@ProviderFor(authenticationClient)
final authenticationClientProvider = Provider<AuthenticationClient>.internal(
  authenticationClient,
  name: r'authenticationClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthenticationClientRef = ProviderRef<AuthenticationClient>;
String _$authenticationUserStreamHash() =>
    r'4b90f438b6f7ef1084865b8d6a1999e0d6e25dc3';

/// Local stream listener provider of the auth state
///
/// Copied from [authenticationUserStream].
@ProviderFor(authenticationUserStream)
final authenticationUserStreamProvider =
    StreamProvider<AuthenticationUser>.internal(
  authenticationUserStream,
  name: r'authenticationUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthenticationUserStreamRef = StreamProviderRef<AuthenticationUser>;
String _$authenticationUserHash() =>
    r'54c8c70b75e192693aa42c46715d48d4d1f9b480';

/// Authenticated user provider
///
/// Exposes User in a non async manner as regular provider
///
/// Copied from [authenticationUser].
@ProviderFor(authenticationUser)
final authenticationUserProvider = Provider<AuthenticationUser>.internal(
  authenticationUser,
  name: r'authenticationUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthenticationUserRef = ProviderRef<AuthenticationUser>;
String _$userIDHash() => r'e8d61e6d3bf3479b61307f5b74b90c17dbda4fdc';

/// See also [userID].
@ProviderFor(userID)
final userIDProvider = AutoDisposeProvider<String>.internal(
  userID,
  name: r'userIDProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIDHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIDRef = AutoDisposeProviderRef<String>;
String _$realmDatabaseHash() => r'e8b6236b439fb99610c73b030995b246d968a62c';

/// See also [realmDatabase].
@ProviderFor(realmDatabase)
final realmDatabaseProvider = FutureProvider<RealmDatabase>.internal(
  realmDatabase,
  name: r'realmDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realmDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RealmDatabaseRef = FutureProviderRef<RealmDatabase>;
String _$dbHash() => r'9c36bc0447644834aa10131dc163d41bc976c1c0';

/// See also [db].
@ProviderFor(db)
final dbProvider = Provider<Collections>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DbRef = ProviderRef<Collections>;
String _$databaseErrorControllerHash() =>
    r'2edd02f9773875f22e23f7e7ec02c0e1eda7f311';

/// See also [databaseErrorController].
@ProviderFor(databaseErrorController)
final databaseErrorControllerProvider =
    Provider<StreamController<DbException>>.internal(
  databaseErrorController,
  name: r'databaseErrorControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseErrorControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseErrorControllerRef = ProviderRef<StreamController<DbException>>;
String _$databaseErrorStreamHash() =>
    r'db793e2f145f24da42b395f96bfa87d999a34b30';

/// See also [databaseErrorStream].
@ProviderFor(databaseErrorStream)
final databaseErrorStreamProvider = StreamProvider<DbException>.internal(
  databaseErrorStream,
  name: r'databaseErrorStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseErrorStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseErrorStreamRef = StreamProviderRef<DbException>;
String _$appDirPathHash() => r'22b325281d96a6c04d432bccec46a75a2e26b0de';

/// app dir path
///
/// Copied from [appDirPath].
@ProviderFor(appDirPath)
final appDirPathProvider = Provider<String>.internal(
  appDirPath,
  name: r'appDirPathProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDirPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDirPathRef = ProviderRef<String>;
String _$appStartUpHash() => r'16b340b1ac38ab625951f2c6c0bc0028c2d1c9fe';

/// See also [appStartUp].
@ProviderFor(appStartUp)
final appStartUpProvider = AutoDisposeFutureProvider<void>.internal(
  appStartUp,
  name: r'appStartUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appStartUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppStartUpRef = AutoDisposeFutureProviderRef<void>;
String _$sharedPrefsHash() => r'394954be62ac9fcd757598b97278fd4215bc6410';

/// SharedPreferences provider
///
/// Copied from [sharedPrefs].
@ProviderFor(sharedPrefs)
final sharedPrefsProvider = Provider<SharedPreferences>.internal(
  sharedPrefs,
  name: r'sharedPrefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPrefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPrefsRef = ProviderRef<SharedPreferences>;
String _$secureStorageHash() => r'ad2ec715369bebecb3159d771877ae4c0582ebae';

/// Secure storage provider
///
/// Copied from [secureStorage].
@ProviderFor(secureStorage)
final secureStorageProvider = Provider<SecureStorage>.internal(
  secureStorage,
  name: r'secureStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SecureStorageRef = ProviderRef<SecureStorage>;
String _$persistentStorageHash() => r'0beb393ecb8fd7577711a8129a620b1b552bc690';

/// Persistent storage provider
///
/// Copied from [persistentStorage].
@ProviderFor(persistentStorage)
final persistentStorageProvider = Provider<PersistentStorage>.internal(
  persistentStorage,
  name: r'persistentStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$persistentStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PersistentStorageRef = ProviderRef<PersistentStorage>;
String _$currentThemeHash() => r'b0c1a22f043854ebe8e1c616f29a511dd31afbc4';

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

/// See also [currentTheme].
@ProviderFor(currentTheme)
const currentThemeProvider = CurrentThemeFamily();

/// See also [currentTheme].
class CurrentThemeFamily extends Family<ThemeData> {
  /// See also [currentTheme].
  const CurrentThemeFamily();

  /// See also [currentTheme].
  CurrentThemeProvider call(
    BuildContext context,
  ) {
    return CurrentThemeProvider(
      context,
    );
  }

  @override
  CurrentThemeProvider getProviderOverride(
    covariant CurrentThemeProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'currentThemeProvider';
}

/// See also [currentTheme].
class CurrentThemeProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [currentTheme].
  CurrentThemeProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => currentTheme(
            ref as CurrentThemeRef,
            context,
          ),
          from: currentThemeProvider,
          name: r'currentThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentThemeHash,
          dependencies: CurrentThemeFamily._dependencies,
          allTransitiveDependencies:
              CurrentThemeFamily._allTransitiveDependencies,
          context: context,
        );

  CurrentThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    ThemeData Function(CurrentThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentThemeProvider._internal(
        (ref) => create(ref as CurrentThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ThemeData> createElement() {
    return _CurrentThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentThemeProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentThemeRef on AutoDisposeProviderRef<ThemeData> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _CurrentThemeProviderElement extends AutoDisposeProviderElement<ThemeData>
    with CurrentThemeRef {
  _CurrentThemeProviderElement(super.provider);

  @override
  BuildContext get context => (origin as CurrentThemeProvider).context;
}

String _$themeNotifierHash() => r'9b82fba4ad77f80b68ad109c2a46f9e2ebbcb5f4';

/// See also [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeNotifier, CurrentTheme>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = AutoDisposeNotifier<CurrentTheme>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
