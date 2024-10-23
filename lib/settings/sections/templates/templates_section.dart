import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../../router/router.dart';
import '../../provider/settings_provider.dart';

class TemplatesSettingsSection extends StatelessWidget {
  const TemplatesSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const padCount = 4;
    return Column(
      children: [
        const VerticalSpacer.normal(),
        SettingsTile(
          title: S.of(context).templates,
          subTitle: 'List of my templates',
          leading: const Icon(Icons.wysiwyg),
          trailing: const _TemplatesCount(padCount),
          onTap: () {
            const TemplatesRoute().push<void>(context);
          },
        ),
        SettingsTile(
          title: S.of(context).activeBasicDataFields.titleCase,
          subTitle: S.of(context).activeBasicDataFieldsSubTitle,
          leading: const Icon(Icons.local_activity_rounded),
          onTap: () {
            const ActivableFieldsRoute().push<void>(context);
          },
        ),
      ],
    );
  }
}

class _TemplatesCount extends ConsumerWidget {
  const _TemplatesCount(this.padCount);

  final int padCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(templatesCountProvider);

    return SettingsTrailing(
      text: count.toString().padRight(padCount),
      icon: const Icon(Icons.navigate_next),
    );
  }
}
