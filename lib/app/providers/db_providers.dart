part of 'providers.dart';

@Riverpod(keepAlive: true)
Future<RealmDatabase> realmDatabase(Ref ref) async {
  final userFuture = ref.watch(authenticationUserStreamProvider.future);

  final user = await userFuture;

  if (user.isAnonymous) ref.invalidateSelf();

  final databaseErrorCtrl = ref.watch(databaseErrorControllerProvider);

  final realmDb = await RealmDatabase.init(user, databaseErrorCtrl);

  ref.onDispose(realmDb.realm.close);

  return realmDb;
}

@Riverpod(keepAlive: true)
Collections collections(Ref ref) {
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
