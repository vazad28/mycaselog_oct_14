import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui/ui.dart';

import '../../../router/router.dart';
import '../../../shared/widgets/form_pop_scope_wrapper.dart';
import '../add_template.dart';
import 'add_template_fields_list.dart';

part './add_template_form.dart';
part './add_template_view.dart';

class AddTemplatePage extends ConsumerStatefulWidget {
  const AddTemplatePage({required this.templateID, super.key});

  final String templateID;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTemplatePageState();
}

class _AddTemplatePageState extends ConsumerState<AddTemplatePage>
    with AddTemplateFormMixin {
  /// Page title
  String get title => widget.templateID == AddTemplateRoute.newItemParam
      ? 'Create Template'
      : 'Edit Template';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      seedForm(ref, widget.templateID, 'ortho');
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addTemplateNotifierProvider, (_, state) {
      if (state.isSuccess) {
        Navigator.of(context).pop(state.data?.templateID);
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
          title: Text(title),
          actions: const [_SubmitButton()],
        ),
        body: const AddTemplateView(),
      ),
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget with AddTemplateFormMixin {
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
