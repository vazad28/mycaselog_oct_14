part of '../forms_provider.dart';

class BasicDataForm extends ConsumerWidget with AppMixins {
  const BasicDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(basicDataFormGroupProvider);

    final activeFieldsList = watchActiveFieldsList(ref);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 3, child: SurgeryDateField()),
              if (activeFieldsList.contains(ActivableCaseField.asa))
                const HorizontalSpacer.normal(),
              if (activeFieldsList.contains(ActivableCaseField.asa))
                const Flexible(child: AsaField()),
            ],
          ),
          const VerticalSpacer.normal(),
          const DiagnosisField(),
          const VerticalSpacer.normal(),
          const SurgeryField(),
          const VerticalSpacer.normal(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeFieldsList.contains(ActivableCaseField.side))
                const Expanded(child: SurgerySideField()),
              if (activeFieldsList.contains(ActivableCaseField.side) &&
                  activeFieldsList.contains(ActivableCaseField.ebl))
                const HorizontalSpacer.normal(),
              if (activeFieldsList.contains(ActivableCaseField.ebl))
                const Expanded(child: EblField()),
            ],
          ),
          const VerticalSpacer.normal(),
          if (activeFieldsList.contains(ActivableCaseField.location))
            const SurgeryLocationField(),

          const VerticalSpacer.normal(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: AnesthesiaField()),
              if (activeFieldsList
                  .contains(ActivableCaseField.anesthesiaBlock)) ...[
                const HorizontalSpacer.normal(),
                const Expanded(child: AnesthesiaBlockField()),
              ],
            ],
          ),
          const VerticalSpacer.normal(),
          if (activeFieldsList.contains(ActivableCaseField.assistants)) ...[
            const AssistantsField(),
          ],

          const VerticalSpacer.normal(),
          const CommentsField(),

          // /// PCP field
          // if (activeFieldsList.contains(ActivableCaseField.pcp)) ...[
          //   Wrapper(_pcpField),
          // ],

          // /// ICD-10 and CPT fields
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     if (activeFieldsList.contains(ActivableCaseField.icd))
          //       Expanded(child: Wrapper(_icdField(context, autoCompleter))),
          //     if (activeFieldsList.contains(ActivableCaseField.cpt))
          //       Expanded(child: Wrapper(_cptField(context, autoCompleter))),
          //   ],
          // ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
