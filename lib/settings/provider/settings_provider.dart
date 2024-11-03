import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers/providers.dart';
import '../../app/services/services.dart';

part '../../generated/settings/provider/settings_provider.g.dart';

/// Use a Notifier provider so we can have access to the settings without async
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsModel build() {
    final userID = ref.read(authenticationUserProvider).id;
    final settings = ref.watch(dbProvider).settingsCollection.getSingle(userID);
    return settings?.toUnmanaged() ?? SettingsModelX.zero(userID);
  }

  /// Update settings
  void _updateSettings(SettingsModel settingsModel) {
    try {
      ref
          .watch(dbProvider)
          .settingsCollection
          .upsert(
            () => settingsModel..timestamp = ModelUtils.getTimestamp,
          )
          .then((res) {
        state = res.toUnmanaged();
      });
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  /// Update settings public method
  void updateSettings(
    SettingsModel Function(SettingsModel) updateCallback,
  ) =>
      _updateSettings(updateCallback(state));
}

/// Template count provider
@riverpod
class TemplatesCount extends _$TemplatesCount {
  @override
  int build() {
    final sub = ref
        .watch(dbProvider)
        .templatesCollection
        .getAll()
        .changes
        .listen((items) => state = items.results.length);

    ref.onDispose(sub.cancel);
    return 0;
  }
}
