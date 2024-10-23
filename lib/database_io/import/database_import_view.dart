import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

import '../../shared/shared.dart';
import '../database_io.dart';

class DatabaseImportView extends ConsumerWidget {
  const DatabaseImportView({required this.onCancel, super.key});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...ref.watch(databaseImportNotifierProvider).maybeWhen(
              success: (value) => [
                Text(
                  'Data imported succeesfully'.hardcoded,
                ),
                const VerticalSpacer.large(),
              ],
              failure: (err) => [
                Text(
                  err.toString().hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              orElse: () => [
                Loading(
                  text: 'preparing data for import'.hardcoded,
                  showSpinner: true,
                ),
              ],
            ),
      ],
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: BackButton(
            onPressed: onCancel,
          ),
        ),
        child,
      ],
    );
  }
}
