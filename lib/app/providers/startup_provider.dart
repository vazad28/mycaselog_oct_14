part of 'providers.dart';

@riverpod
Future<void> appStartUp(AppStartUpRef ref) async {
  /// Load realm database
  await ref.watch(realmDatabaseProvider.future);

  /// load setting provider
  //await ref.watch(settingsNotifierProvider.notifier).init();
}