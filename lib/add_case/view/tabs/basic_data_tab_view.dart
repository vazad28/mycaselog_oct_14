part of '../add_case_page.dart';

class BasicDataTabView extends StatelessWidget {
  const BasicDataTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 12, right: 12),
      children: const [
        ///<-- Patient data form
        LabeledDivider(
          label: 'Patient data',
          height: 36,
        ),
        _PatientDataForm(),
        // <-- Basic case data frorm
        LabeledDivider(
          label: 'Basic case data',
          height: 36,
        ),
        BasicDataForm(),
      ],
    );
  }
}

class _PatientDataForm extends ConsumerWidget with AddCaseFormMixin {
  const _PatientDataForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    final crypt = caseModel.patientModel?.crypt;

    const child = PatientDataForm();

    if (crypt != null) {
      return child; // we are not reading the label if it is edit
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        FabButton(
          roundedCorner: true,
          onPressed: () {
            final patientModel = caseModel.patientModel;
            if (patientModel == null) return;
            context
                .openModalPage<PatientModel?>(
              child: SahLabelOcr<PatientModel>(model: patientModel),
            )
                .then((patientModel) {
              if (patientModel == null) return;

              ref
                  .watch(patientDataFormGroupProvider.notifier)
                  .updatePatientDataForm(patientModel);
            });
          },
          icon: Icons.scanner,
        ),
      ],
    );
  }
}
