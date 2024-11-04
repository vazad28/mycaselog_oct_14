import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../app/app.dart';
import '../../app/app_mixins.dart';
import '../../case_pdf/case_pdf.dart';
import '../../router/router.dart';
import '../../settings/settings.dart';
import '../case_details.dart';

class CaseDetailsPage extends ConsumerStatefulWidget {
  const CaseDetailsPage({
    required this.caseID,
    this.activeTab,
    super.key,
  });

  final String caseID;
  final int? activeTab;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseDetailsPageState();
}

class _CaseDetailsPageState extends ConsumerState<CaseDetailsPage>
    with CaseDetailsMixin, AppMixins, TickerProviderStateMixin {
  /// Late insstance variales
  late int _activeTab;
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    /// active tab based on router or settings
    //print('active tab ${ref.read(settingsNotifierProvider).caseTileNavigate}');
    _activeTab =
        widget.activeTab ?? ref.read(settingsNotifierProvider).caseTileNavigate;

    if (_activeTab > 2) {
      _activeTab = ref.read(localStorageProvider).caseTileNavigate;
    }

    /// set active tab
    _tabController =
        TabController(vsync: this, length: 3, initialIndex: _activeTab)

          /// set listener for the tab change to update the bottom nav bar
          ..addListener(() {
            _tabController.index != 2
                ? showBottomNavbar(ref)
                : hideBottomNavbar(ref);
            _activeTab = _tabController.index;
          });

    /// Seed the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(caseIDProvider.notifier).update((_) => widget.caseID);

      /// Needs future.zero to work on initState
      if (_activeTab == 2) {
        Future<void>.delayed(Duration.zero).then((_) => hideBottomNavbar(ref));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: CaseDetailsAppBar(
                tabController: _tabController,
                innerBoxIsScrolled: innerBoxIsScrolled,
                onMoreMenuTap: _onCaseDetailsMoreMenuTap,
              ),
            ),
          ];
        },
        body: AsyncValueWidget<CaseModel>(
          value: ref.watch(caseDetailsNotifierProvider),
          data: (data) {
            return CaseDetailsView(
              tabController: _tabController,
              onTap: _openAddCase,
            );
          },
        ),
      ),
    );

    return PopScope(
      child: scaffold,
      onPopInvokedWithResult: (didPop, _) {
        if (!isBottomNavbarVisible(ref)) showBottomNavbar(ref);

        ref.read(localStorageProvider).setCaseTileNavigate(_activeTab);
      },
    );
  }

  /// Open add/edit case modal
  Future<void> _openAddCase(int index) {
    final currentCaseModel = watchCaseDetailsModel(ref).requireValue;
    return AddCaseRoute(caseID: currentCaseModel.caseID, tabIndex: index)
        .push<String?>(context);
  }

  Future<void> _onCaseDetailsMoreMenuTap() {
    return context
        .openActionsBottomSheet(caseDetailsActions.values.toList())
        .then((selected) {
      if (!mounted || selected == null) return null;

      switch (selected.action) {
        case CaseDetailsActionEnum.generateCasePdf:
          return context.openModalPage<void>(
            child: CasePdfPage(
              caseID: widget.caseID,
            ),
          );

        case CaseDetailsActionEnum.duplicateCase:
          final currentCaseModel = watchCaseDetailsModel(ref).requireValue;
          duplicateCase(ref, currentCaseModel).then((newCaseID) {
            if (mounted) {
              AddCaseRoute(caseID: newCaseID).pushReplacement(context);
            }
          });

        case CaseDetailsActionEnum.deleteCase:
          context
              .showConfirmDialog(S.of(context).contentHardDeleteWarning)
              .then((res) {
            if (!res) return;
            final currentCaseModel = watchCaseDetailsModel(ref).requireValue;
            deleteCase(ref, currentCaseModel).then((_) {
              if (mounted) context.pop();
            }).catchError((_) {
              if (mounted) context.showSnackBar('Failed to delete case');
            });
          });
      }
    });
  }
}
