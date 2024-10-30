import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:label_ocr/label_ocr.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

import '../../app/app_mixins.dart';
import '../../core/core.dart';
import '../add_case.dart';

part './tabs/basic_data_tab_view.dart';
part './tabs/template_data_tab_view.dart';

class AddCasePage extends ConsumerStatefulWidget {
  const AddCasePage({
    required this.caseID,
    required this.tabIndex,
    super.key,
  });

  final String caseID;
  final int tabIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCasePageState();
}

class _AddCasePageState extends ConsumerState<AddCasePage>
    with AddCaseFormMixin, SingleTickerProviderStateMixin, AppMixins {
  /// late variable
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    /// set controller for tabs
    _tabController = TabController(vsync: this, length: 2);

    /// Seed the case provider
    SchedulerBinding.instance.addPostFrameCallback((_) {
      hideBottomNavbar(ref);

      Future<void>.delayed(const Duration(milliseconds: 300)).then((value) {
        if (widget.tabIndex > 0) _tabController.animateTo(widget.tabIndex);
      });

      seedForm(ref, widget.caseID);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<CaseModel>>(addCaseNotifierProvider, (prev, next) {
      if (next.isSuccess) {
        Navigator.of(context).pop();
        return;
      }

      if (next.isFailure) {
        switch (next.failure) {
          case BasicTabFormValidationError():
            return _tabController.animateTo(0);
          case TemplateTabFormValidationError():
            return _tabController.animateTo(1);
          default:
            errorTracker.log(next.failure);
            context.showSnackBar(next.failure.toString());
        }
      }
    });

    final scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primaryContainer,
        foregroundColor: context.colorScheme.onPrimaryContainer,
        title: Text(
          widget.caseID == 'new' ? 'Add Case' : 'Edit Case',
        ),
        actions: const [
          _SubmitButton(),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: context.colorScheme.secondary,
          unselectedLabelColor: context.colorScheme.onSurfaceVariant,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(
              text: CaseDetailsTabsEnum.values.names[0].titleCase.toUpperCase(),
            ),
            Tab(
              text: CaseDetailsTabsEnum.values.names[1].titleCase.toUpperCase(),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false, //critical
        child: AsyncValueWidget(
          value: ref.watch(addCaseSeederProvider),
          data: (_) => TabBarView(
            controller: _tabController,
            children: const [
              KeepAliveWrapper(
                key: Key('__basic_case_data_add_case_tab__'),
                child: BasicDataTabView(),
              ),
              KeepAliveWrapper(
                key: Key('__template_case_data_add_case_tab__'),
                child: TemplateDataTabView(),
              ),
            ],
          ),
        ),
      ),
    );

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        switchNavBarVisibility(ref, visibility: visibility);
      },
      routeObserver: pageRouteObserver(ref),
      child: scaffold,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
class _SubmitButton extends ConsumerWidget with AddCaseFormMixin {
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
