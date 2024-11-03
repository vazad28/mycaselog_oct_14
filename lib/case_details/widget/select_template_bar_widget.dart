import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

class SelectTemplateBarWidget extends StatelessWidget {
  const SelectTemplateBarWidget({required this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Widget child = SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const HorizontalSpacer.large(),
            Text(
              S.of(context).surgeryTemplate,
              style: theme.textTheme.bodyMedium,
            ),
            Expanded(
              child: Text(
                (title ?? S.of(context).select).sentenceCase,
                textAlign: TextAlign.end,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const HorizontalSpacer.large(),
          ],
        ),
      ),
    );
    return child;
  }
}
