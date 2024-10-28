import 'dart:async';

import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app.dart';

part './support_data_mixin.dart';
part '../../generated/support_data/provider/support_data_provider.g.dart';

@riverpod
class SupportDataNotifier extends _$SupportDataNotifier {
  @override
  SupportDataModel build() {
    final sub = ref
        .watch(collectionsProvider)
        .supportDataCollection
        .getAll()
        .changes
        .listen((data) {
      if (data.results.isNotEmpty) state = data.results.last.toUnmanaged();
    });

    ref.onDispose(sub.cancel);

    return SupportDataModelX.zero(ref.read(userIDProvider));
  }

  Future<void> _updateSupportData(SupportDataModel supportDataModel) async {
    try {
      await ref.watch(collectionsProvider).supportDataCollection.upsert(
            () => supportDataModel..timestamp = ModelUtils.getTimestamp,
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  void upsertAnesthesiaBlock(String block, CrudAction action) {
    if (action == CrudAction.delete) {
      _updateSupportData(state..anesthesiaBlocks.remove(block));
    } else {
      _updateSupportData(state..anesthesiaBlocks.replaceOrAdd(block));
    }
  }

  void upsertAssistant(AssistantModel model, CrudAction action) {
    if (action == CrudAction.delete) {
      _updateSupportData(
          state..assistants.removeComplex(model, (e) => e.assistantID),);
    } else {
      _updateSupportData(
          state..assistants.replaceOrAddComplex(model, (e) => e.assistantID),);
    }
  }

  void upsertSurgeryLocation(SurgeryLocationModel model, CrudAction action) {
    if (action == CrudAction.delete) {
      _updateSupportData(
          state..surgeryLocations.removeComplex(model, (e) => e.locationID),);
    } else {
      _updateSupportData(state
        ..surgeryLocations.replaceOrAddComplex(model, (e) => e.locationID),);
    }
  }

  void upsertActivableCaseFields(List<ActivableCaseField>? fields) {
    if (fields == null) {
      _updateSupportData(state..activeBasicFields.clear());
      return;
    }
    state.activeBasicFields.clear();
    _updateSupportData(
      state..activeBasicFields.addAll(fields.names.toRealmList),
    );
  }
}
