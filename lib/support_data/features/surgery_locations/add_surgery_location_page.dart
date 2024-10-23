import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui/ui.dart';

import '../../support_data.dart';

class AddSurgeryLocationPage extends ConsumerStatefulWidget {
  const AddSurgeryLocationPage({
    required this.locationID,
    super.key,
  });

  final String locationID;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSurgeryLocationPageState();
}

class _AddSurgeryLocationPageState
    extends ConsumerState<AddSurgeryLocationPage> {
  late FormGroup formGroup;
  late SurgeryLocationModel surgeryLocationModel;

  @override
  void initState() {
    super.initState();

    surgeryLocationModel =
        ref.read(supportDataNotifierProvider).surgeryLocations.firstWhere(
              (e) => e.locationID == widget.locationID,
              orElse: SurgeryLocationModelX.zero,
            );

    formGroup = FormGroup({
      SurgeryLocationProps.name.name: FormControl<String>(
        value: surgeryLocationModel.name,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      SurgeryLocationProps.phone.name: FormControl<String>(
        value: surgeryLocationModel.phone,
        validators: [],
      ),
      SurgeryLocationProps.address.name: FormControl<String>(
        value: surgeryLocationModel.address,
        validators: [],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: Center(
        child: _AddSurgeryLocationPageForm(
          formGroup: formGroup,
          title: widget.locationID == 'new'
              ? 'Add Surgery Location'
              : 'Edit Surgery Location',
          submitButton: FormSubmitButtonBar(
            onSubmit: () {
              if (!formGroup.valid) {
                formGroup.markAllAsTouched();
                return;
              }

              /// update with basic data
              final surgeryLocationModelJson = {
                ...surgeryLocationModel.toJson(),
                ...formGroup.value,
              };
              final model =
                  SurgeryLocationModelX.fromJson(surgeryLocationModelJson);
              ref
                  .watch(supportDataNotifierProvider.notifier)
                  .upsertSurgeryLocation(model, CrudAction.add);

              if (context.mounted) Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );

    return scaffold;
  }
}

class _AddSurgeryLocationPageForm extends ConsumerWidget {
  const _AddSurgeryLocationPageForm({
    required this.formGroup,
    required this.submitButton,
    required this.title,
  });
  final FormGroup formGroup;
  final Widget submitButton;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = ReactiveForm(
      formGroup: formGroup,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const VerticalSpacer.large(),
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.name.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.name.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The surgeryLocation name must be at least ${(error as Map)['requiredLength']} characters long',
            },
          ),
          const VerticalSpacer.large(),
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.phone.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.phone.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The surgery location phone must be at least ${(error as Map)['requiredLength']} digits long',
            },
          ),
          const VerticalSpacer.large(),
          submitButton,
        ],
      ),
    );

    return CenterFormWrapper(child: child);
  }
}
