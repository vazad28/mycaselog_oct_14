import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:models/models.dart';
import 'package:ui/ui.dart';

import '../../app/app_mixins.dart';
import '../../case_timeline/case_timeline.dart';
import '../case_details.dart';

part './tabs/basic_data_tab.dart';
part './tabs/templated_data_tab.dart';
part './tabs/timeline_data_tab.dart';

class CaseDetailsView extends StatelessWidget {
  const CaseDetailsView({
    required this.tabController,
    required this.onTap,
    super.key,
  });

  final void Function(int) onTap;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: const KeepAliveWrapper(
            key: Key('__basicCaseDataTab__'),
            child: CaseDetailsBasicTab(),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(1),
          child: const KeepAliveWrapper(
            key: Key('__templateCaseDataTab__'),
            child: CaseDetailsTemplatedTab(),
          ),
        ),
        const KeepAliveWrapper(
          key: Key('__templateCaseDataTab__'),
          child: CaseDetailsTimelineTab(),
        ),
      ],
    );
  }
}
