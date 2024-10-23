import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../../router/router.dart';
import '../../../shared/shared.dart';
import '../../support_data.dart';

class SurgeryLocationsPage extends ConsumerWidget {
  const SurgeryLocationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).surgeryLocationsTitle.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.openModalPage<SurgeryLocationModel>(
                child: const AddSurgeryLocationPage(
                  locationID: SurgeryLocationsRoute.newItemParam,
                ),
              );
            },
          ),
        ],
      ),
      body: const _SurgeryLocationsView(),
    );
  }
}

class _SurgeryLocationsView extends ConsumerWidget {
  const _SurgeryLocationsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final surgeryLocations = ref.watch(
      supportDataNotifierProvider.select(
        (value) => value.surgeryLocations.toList(),
      ),
    );

    if (surgeryLocations.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No Surgery Locations',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: surgeryLocations.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final surgeryLocation = surgeryLocations[index];
        final child = ListTile(
          title: Text(
            surgeryLocation.name ?? 'No name',
          ),
          subtitle: surgeryLocation.phone == null
              ? null
              : Text(surgeryLocation.phone!),
          onTap: () => context.openModalPage<SurgeryLocationModel>(
            child: AddSurgeryLocationPage(
              locationID: surgeryLocation.locationID,
            ),
          ),
        );

        return DismissibleListTile(
          child: child,
          onDismissed: () {
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertSurgeryLocation(surgeryLocation, CrudAction.delete);
          },
        );
      },
    );
  }
}
