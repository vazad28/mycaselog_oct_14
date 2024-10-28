import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

part 'case_details_event.dart';

part '../../generated/case_details/provider/case_details_provider.freezed.dart';
part '../../generated/case_details/provider/case_details_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class CaseDetailsNotifier extends _$CaseDetailsNotifier {
  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  /// Map events to state
  void on(CaseDetailsEvent event) {
    event.map(add: (value) => {});
  }
}
