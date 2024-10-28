import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../../router/router.dart';
import '../../support_data.dart';

class AssistantsPage extends ConsumerWidget {
  const AssistantsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).assistants.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.openModalPage<AssistantModel>(
                child: const AddAssistantPage(
                  assistantID: AssistantsRoute.newItemParam,
                ),
              );
            },
          ),
        ],
      ),
      body: const _AssistantsView(),
    );
  }
}

class _AssistantsView extends ConsumerWidget {
  const _AssistantsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final assistants = ref.watch(
      supportDataNotifierProvider.select((data) => data.assistants),
    );

    if (assistants.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No assistants', textAlign: TextAlign.center),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: assistants.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final assistantModel = assistants[index];
        final child = ListTile(
          title: Text(
            assistantModel.name ?? 'No name',
          ),
          subtitle:
              assistantModel.phone == null ? null : Text(assistantModel.phone!),
          onTap: () => context.openModalPage<AssistantModel>(
            child: AddAssistantPage(assistantID: assistantModel.assistantID),
          ),
        );
        return DismissibleListTile(
          child: child,
          onDismissed: () {
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertAssistant(assistantModel, CrudAction.delete);
          },
        );
      },
    );
  }
}
