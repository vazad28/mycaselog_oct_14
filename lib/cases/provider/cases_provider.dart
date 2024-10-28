import 'dart:async';

import 'package:models/models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app.dart';

part '../../generated/cases/provider/cases_provider.g.dart';

/// case tile style provider
@riverpod
class CaseTileStyle extends _$CaseTileStyle {
  @override
  int build() {
    return ref.watch(localStorageProvider).getCaseListTileStyle();
  }

  // ignore: use_setters_to_change_properties
  void update(int toggledStyle) {
    state = toggledStyle;
    ref.read(localStorageProvider).setCaseListTileStyle(toggledStyle);
  }
}

/// Cases  stream  provider
@Riverpod(keepAlive: true)
class CasesNotifier extends _$CasesNotifier {
  @override
  Stream<RealmResultsChanges<CaseModel>> build() {
    /// Listen for settings provider to start or stop firebse sync
    // ref.listen(firestoreLiveSyncProvider, (previous, next) {
    //   errorTracker.log('settingsNotifierProvider listening for sync');
    // });

    return ref
        .watch(collectionsProvider)
        .casesCollection
        .getAll(orderByField: BasicDataModelProps.surgeryDate.name)
        .changes;
  }

  /// Full text search cases
  RealmResults<CaseModel> searchCases(String searchTerm) {
    return ref.watch(collectionsProvider).casesCollection.search(searchTerm);
  }

  Future<void> pullToRefresh() {
    try {
      return Future<void>.delayed(const Duration(milliseconds: 1600)).then((_) {
        return ref
            .watch(collectionsProvider)
            .casesCollection
            .refreshBacklinks();
      });
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('Refresh failed');
      return Future<void>.sync(() => {});
    }
  }
}
