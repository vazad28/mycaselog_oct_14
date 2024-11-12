part of 'providers.dart';

@riverpod
Future<void> appStartUp(Ref ref) async {
  /// Load realm database
  await ref.watch(realmDatabaseProvider.future);

  /// load setting provider
  //await ref.watch(settingsNotifierProvider.notifier).init();
}
