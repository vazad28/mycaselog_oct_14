import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

part '../../generated/cases/provider/cases_provider.freezed.dart';
part '../../generated/cases/provider/cases_provider.g.dart';
part 'cases_event.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class CasesNotifier extends _$CasesNotifier {
  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  /// Map events to state
  void on(CasesEvent event) {
    event.map(add: (value) => {});
  }
}
