import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../shared/shared.dart';
import '../user_profile.dart';

class UserSpecialityWidget extends ConsumerWidget
    with UserProfileEventMixin, UserProfileStateMixin {
  const UserSpecialityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speciality = userSpeciality(ref);

    final specialitiesMap = SurgicalSpeciality.values.asNameMap();

    return TextButton(
      child: Text(
        specialitiesMap[speciality]?.name.titleCase ?? 'Select speciality',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onPressed: () async {
        final items = specialitiesMap.entries
            .map((e) => RadioSelectOption(title: e.value.name, value: e.key))
            .toList();

        final selectedSpeciality = await context.openModalPage<String>(
          child: RadioSelectModal(
            items: items,
            selectedValue: speciality,
            title: S.of(context).selectSpeciality,
          ),
        );

        if (selectedSpeciality == null) return;

        updateUserSpeciality(ref, selectedSpeciality);
      },
    );
  }
}
