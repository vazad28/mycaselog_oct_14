import 'package:extensions/extensions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers/providers.dart';

part '../../generated/case_details/provider/case_details_provider.g.dart';
part 'case_details_menu_actions.dart';
part 'case_details_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

final caseIDProvider = StateProvider.autoDispose<String?>((ref) => null);

final caseModelProvider = StreamProvider.autoDispose<AsyncValue<CaseModel>>(
  (ref) {
    final caseID = ref.watch(caseIDProvider);
    if (caseID == null) throw Exception('Case ID is null');

    final caseModelChange =
        ref.watch(dbProvider).casesCollection.getSingle(caseID);
    return caseModelChange!.changes
        .map((event) => AsyncValue.data(event.object));
  },
);

@riverpod
class CaseDetailsNotifier extends _$CaseDetailsNotifier {
  @override
  AsyncValue<CaseModel> build() {
    final caseID = ref.watch(caseIDProvider);

    if (caseID == null) return const AsyncLoading();

    final sub = ref
        .watch(dbProvider)
        .casesCollection
        .getSingle(caseID)
        ?.changes
        .listen((data) {
      state = AsyncData(data.object);
    });

    ref.onDispose(() => sub?.cancel());

    return const AsyncLoading();
  }
}

@riverpod
AsyncValue<TemplateModel?> caseDetailsTemplateModel(
  Ref ref,
) {
  final caseModelAsync = ref.watch(caseDetailsNotifierProvider);

  final caseModel = caseModelAsync.value;
  if (caseModel == null) return const AsyncLoading();
  if (caseModel.templateID == null) return const AsyncValue.data(null);

  final templateModel = ref
      .watch(dbProvider)
      .templatesCollection
      .getSingle(caseModel.templateID!);

  if (templateModel == null) {
    return AsyncError('Missing template for ID', StackTrace.current);
  }

  return AsyncValue.data(templateModel);
}
