part of 'providers.dart';

/// SharedPreferences provider
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

/// Secure storage provider
@Riverpod(keepAlive: true)
SecureStorage secureStorage(SecureStorageRef ref) {
  return const SecureStorage();
}

/// Persistent storage provider
@Riverpod(keepAlive: true)
PersistentStorage persistentStorage(PersistentStorageRef ref) {
  return PersistentStorage(
    sharedPreferences: ref.watch(sharedPrefsProvider),
  );
}
