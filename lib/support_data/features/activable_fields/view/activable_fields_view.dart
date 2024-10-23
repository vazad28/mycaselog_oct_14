part of './activable_fields_page.dart';

class ActivableFieldsView extends ConsumerWidget with SupportDataMixin {
  const ActivableFieldsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFieldsList = watchActiveFieldsList(ref);

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSpacing.sm),
      children: [
        const VerticalSpacer.normal(),
        const LabeledDivider(label: 'Patient data field'),
        const VerticalSpacer.normal(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: NonActivableBsicDataField('name'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.gender,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            const VerticalSpacer.normal(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.yob,
                    activeFieldsList,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.bmi,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
          ],
        ),
        const VerticalSpacer.normal(),
        const LabeledDivider(label: 'Basic data field'),
        const VerticalSpacer.normal(),
        Column(
          children: [
            const NonActivableBsicDataField('surgery date'),
            const VerticalSpacer.normal(),
            const NonActivableBsicDataField('diagnosis'),
            const VerticalSpacer.normal(),
            const NonActivableBsicDataField('surgery'),
            const VerticalSpacer.normal(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.side,
                    activeFieldsList,
                  ),
                ),
                const HorizontalSpacer.normal(),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.location,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            const VerticalSpacer.normal(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.ebl,
                    activeFieldsList,
                  ),
                ),
                const HorizontalSpacer.normal(),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.asa,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            const VerticalSpacer.normal(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: NonActivableBsicDataField('anesthesia'),
                ),
                const HorizontalSpacer.normal(),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.anesthesia,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            const VerticalSpacer.normal(),
            ActivableBasicField(
              ActivableCaseField.assistants,
              activeFieldsList,
            ),
            const VerticalSpacer.normal(),
            const NonActivableBsicDataField('comments'),
            const VerticalSpacer.normal(),
            ActivableBasicField(ActivableCaseField.pcp, activeFieldsList),
            const VerticalSpacer.normal(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.icd,
                    activeFieldsList,
                  ),
                ),
                const HorizontalSpacer.normal(),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.cpt,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
