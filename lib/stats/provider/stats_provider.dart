import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

part '../../generated/stats/provider/stats_provider.freezed.dart';
part '../../generated/stats/provider/stats_provider.g.dart';
part 'stats_event.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class StatsNotifier extends _$StatsNotifier {
  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  /// Map events to state
  void on(StatsEvent event) {
    event.map(add: (value) => {});
  }
}
