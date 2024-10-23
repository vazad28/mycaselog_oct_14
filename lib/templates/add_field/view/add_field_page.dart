import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../../shared/widgets/form_pop_scope_wrapper.dart';
import '../add_field.dart';
import 'add_field_form.dart';

part 'add_field_view.dart';

class AddFieldPage extends ConsumerStatefulWidget {
  const AddFieldPage({required this.templateFieldModel, super.key});

  final TemplateFieldModel templateFieldModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFieldPageState();
}

class _AddFieldPageState extends ConsumerState<AddFieldPage>
    with AddFieldFormMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      seedForm(ref, widget.templateFieldModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addFieldNotifierProvider, (_, state) {
      if (state.isSuccess) {
        Navigator.of(context).pop(state.data);
        return;
      }
      if (state.isFailure) {
        context.showSnackBar(state.failure.toString());
        return;
      }
    });

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        switchNavBarVisibility(ref, visibility: visibility);
      },
      routeObserver: pageRouteObserver(ref),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Template Field'),
          actions: const [_SubmitButton()],
        ),
        body: const AddFieldView(),
      ),
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget with AddFieldFormMixin {
  const _SubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = formSubmitStatus(ref);

    return status.maybeWhen(
      loading: (_) => IconButton(
        onPressed: () => {},
        icon: const Spinner(),
      ),
      orElse: () => TextButton(
        child: Text(S.of(context).save),
        onPressed: () => submitForm(ref),
      ),
    );
  }
}
