import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

import '../sync.dart';

class SyncPage extends ConsumerWidget {
  const SyncPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SyncPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///title widget
    final title = Text(
      'Sync Data',
      style: Theme.of(context).textTheme.titleLarge,
    );

    final subTitle = Text(
      'Sync server data to local database',
      style: Theme.of(context).textTheme.bodyMedium,
    ).paddingOnly(top: AppSpacing.sm, bottom: AppSpacing.md);

    /// body
    const syncView = Expanded(
      flex: 3,
      child: Center(
        child: SyncView(),
      ),
    );

    /// footer with done button
    final doneButton = FabButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icons.close,
      roundedCorner: true,
    ).paddingOnly(top: AppSpacing.xlg);

    final child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        title,
        subTitle,
        syncView,
        doneButton,
        const Spacer(),
      ],
    );

    return Material(
      child: child.paddingSymmetric(vertical: 8, horizontal: 16),
    );
  }
}
