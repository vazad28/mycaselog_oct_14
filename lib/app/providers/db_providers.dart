part of 'providers.dart';

@Riverpod(keepAlive: true)
Future<RealmDatabase> realmDatabase(Ref ref) async {
  final userFuture = ref.watch(authenticationUserStreamProvider.future);

  final user = await userFuture;
  if (user.isAnonymous) ref.invalidateSelf();

  /// db error stream controller instance
  final databaseErrorCtrl = ref.watch(databaseErrorControllerProvider);

  /// instance of secureStorage for keeping enck key for database
  final secureStorage = ref.watch(secureStorageProvider);

  final realmDb =
      await RealmDatabase.init(user, secureStorage, databaseErrorCtrl);

  ref.onDispose(realmDb.realm.close);

  return realmDb;
}

@Riverpod(keepAlive: true)
Collections db(Ref ref) {
  final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;
  if (kDebugMode) print('creating collections provider');
  return Collections(realmDatabase: realmDatabase);
}

@Riverpod(keepAlive: true)
StreamController<DbException> databaseErrorController(
  Ref ref,
) {
  return StreamController<DbException>.broadcast();
}

@Riverpod(keepAlive: true)
Stream<DbException> databaseErrorStream(Ref ref) {
  return ref.watch(databaseErrorControllerProvider).stream;
}
