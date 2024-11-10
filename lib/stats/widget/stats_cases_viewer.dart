import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../app/app.dart';
import '../../case_details/case_details.dart';
import '../../cases/cases.dart';
import '../stats.dart';

class StatsCasesViewer extends StatelessWidget {
  const StatsCasesViewer({super.key, this.initialChildSize});

  final double? initialChildSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        initialChildSize: initialChildSize ?? 0.25,
        minChildSize: initialChildSize ?? 0.25,
        expand: false,
        builder: (_, controller) {
          return Material(
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.md),
                topRight: Radius.circular(AppSpacing.md),
              ),
            ),
            child: _StatsCasesViewerView(controller),
          );
        },
      ),
    );
  }
}

/// StatsCasesViewer VIEW Widget
class _StatsCasesViewerView extends ConsumerWidget {
  const _StatsCasesViewerView(
    ScrollController controller,
  ) : _controller = controller;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsCasesState = ref.watch(statsCasesProvider);

    final child = statsCasesState.maybeWhen(
      success: (result) => _CasesListViewBuilder(
        caseModels: result,
        controller: _controller,
      ),
      failure: (f) => SizedBox.expand(child: Center(child: Text(f.message))),
      orElse: () => const Text(' '),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child,
    );
  }
}

class _CasesListViewBuilder extends StatelessWidget {
  const _CasesListViewBuilder({
    required this.caseModels,
    required this.controller,
  });
  final ScrollController controller;
  final List<CaseModel> caseModels;

  Widget _caseTileBuilder(BuildContext context, CaseModel caseModel) {
    return OpenContainer(
      //useRootNavigator: true, // to show full screen
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: Colors.transparent,
      closedElevation: 0,
      openBuilder: (context, action) => CaseDetailsPage(
        caseID: caseModel.caseID,
      ),
      closedBuilder: (context, action) {
        return _CaseTileDenseLayout(caseModel: caseModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final casesList = caseModels.reversed.toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      controller: controller,
      itemBuilder: (context, index) =>
          _caseTileBuilder(context, casesList[index]),
      itemCount: casesList.length,
    );
  }
}

class _CaseTileDenseLayout extends StatelessWidget {
  const _CaseTileDenseLayout({required this.caseModel});

  final CaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const leftIndent = 64.0;
    const spacer = SizedBox(height: 8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: 4,
            width: 40,
          ),
        ),
        spacer,
        Row(
          children: [
            LeadingInfo(
              caseModel: caseModel,
              width: leftIndent,
              style: theme.textTheme.bodyLarge,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    caseModel.diagnosis ?? S.of(context).noTitle,
                    style: theme.textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    caseModel.surgery ?? S.of(context).noTitle,
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            TrailingInfo(
              caseModel: caseModel,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        spacer,
        const Divider(
          indent: leftIndent,
          height: 1,
        ),
      ],
    );
  }
}
