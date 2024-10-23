import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

class AddFieldOptionBar extends StatelessWidget {
  const AddFieldOptionBar({required this.onAddOption, super.key});

  final void Function(String) onAddOption;

  @override
  Widget build(BuildContext context) {
    final Widget button = FilledButton.icon(
      onPressed: () async {
        final res = await context.showInputDialog<String?>(
          title: S.of(context).addOption,
          value: '',
        );
        if (res?.isEmpty ?? true) return;
        onAddOption.call(res!);
      },
      icon: const Icon(Icons.add),
      label: Text(S.of(context).addOption.titleCase),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );

    final Widget tile = Row(
      children: [
        const HorizontalSpacer.normal(),
        Expanded(
          child: Text(S.of(context).options.toUpperCase()),
        ),
        button,
        const HorizontalSpacer.normal(),
      ],
    );

    return SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: context.colorScheme.surfaceContainerHighest,
        child: tile,
      ),
    );
  }
}
