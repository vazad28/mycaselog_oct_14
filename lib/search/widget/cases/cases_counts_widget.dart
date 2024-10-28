import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

import '../../../cases/cases.dart';

class CasesCountWidget extends ConsumerWidget {
  const CasesCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(casesNotifierProvider),
      data: (data) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Text(
          data.results.length.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}