part of 'providers.dart';

/// SharedPreferences provider
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(Ref ref) {
  throw UnimplementedError();
}

/// Secure storage provider
@Riverpod(keepAlive: true)
SecureStorage secureStorage(Ref ref) {
  return const SecureStorage();
}

/// Persistent storage provider
@Riverpod(keepAlive: true)
PersistentStorage persistentStorage(Ref ref) {
  return PersistentStorage(
    sharedPreferences: ref.watch(sharedPrefsProvider),
  );
}
