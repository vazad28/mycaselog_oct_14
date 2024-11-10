import 'package:collection/collection.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils/utils.dart';

import '../../app/app_exceptions.dart';
import '../stats.dart';

part '../../generated/stats/provider/stats_cases_provider.g.dart';

@riverpod
class StatsCases extends _$StatsCases {
  @override
  StateOf<List<CaseModel>> build() {
    /// Watch for currently selected index of the chart
    final touchedIndex = ref.watch(touchedIndexProvider);

    /// watch change in the state of the chart data
    final chartDataModelState = ref.watch(statsDataProvider);

    if (chartDataModelState.isFailure) {
      return StateOf<List<CaseModel>>.failure(chartDataModelState.failure);
    }

    /// get list of caseIDs from the ChartDataModel
    final caseListIDs = chartDataModelState.data?.data.map((e) => e.data);

    /// Load new list
    _getStatsCases(caseListIDs, touchedIndex);

    return const StateOf<List<CaseModel>>.loading();
  }

  Future<void> _getStatsCases(
    Iterable<Iterable<String>>? caseListIDs,
    int? touchedIndex,
  ) async {
    if (caseListIDs?.isEmpty ?? true) {
      state = StateOf<List<CaseModel>>.failure(
        AppException.generic(S.current.noCases),
      );
      return;
    }

    ///If we have touched Index non null we fetch only the touched Index data
    ///point cases else we fetch all ids
    var caseIDsToFetch = <String>[];

    if (touchedIndex == null) {
      caseIDsToFetch = caseListIDs!.flattened.toList();
    } else {
      caseIDsToFetch = caseListIDs!.elementAt(touchedIndex).toList();
    }

    try {
      final models = await ref
          .watch(statsRepositoryProvider)
          .getStatsCases(caseIDsToFetch);
      state = StateOf<List<CaseModel>>.success(models);
    } catch (err) {
      state = StateOf<List<CaseModel>>.failure(AppException.fromError(err));
    }
  }
}
