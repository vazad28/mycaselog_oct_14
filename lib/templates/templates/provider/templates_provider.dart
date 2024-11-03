import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/providers.dart';

part '../../../generated/templates/templates/provider/templates_provider.g.dart';

/// Flag to show only active templates or all templates
final showActiveTemplatesProvider =
    StateProvider.autoDispose<bool>((ref) => true);

/// Templates Events
enum TemplateEvent { deactivate, delete, reactivate, share, unShare }

@riverpod
class TemplatesNotifier extends _$TemplatesNotifier {
  @override
  Stream<Iterable<TemplateModel>> build() {
    final showActiveOnly = ref.watch(showActiveTemplatesProvider);

    return ref
        .watch(dbProvider)
        .templatesCollection
        .getAll()
        .changes
        .asyncMap((data) {
      return showActiveOnly
          ? data.results.where((e) => e.removed == 0)
          : data.results.where((e) => e.removed == 1);
    });
  }

  Future<void> updateTemplate(
    TemplateModel templateModel,
    TemplateEvent event,
  ) {
    return ref.watch(dbProvider).templatesCollection.upsert(
      () {
        return switch (event) {
          TemplateEvent.share => templateModel..shared = true,
          TemplateEvent.deactivate => templateModel..removed = 2,
          TemplateEvent.delete => templateModel..removed = 1,
          TemplateEvent.reactivate => templateModel..removed = 0,
          TemplateEvent.unShare => templateModel..shared = false,
        };
      },
    );
  }
}
