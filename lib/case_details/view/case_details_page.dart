import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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

class _CaseDetailsPageState extends ConsumerState<CaseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
