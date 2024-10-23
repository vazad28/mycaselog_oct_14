import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../sections/sections.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          /// Spacer
          const VerticalSpacer.large(),

          /// main setting - All theme and Templates setting
          SettingsTileHeader(title: context.l10n.themeSettings.titleCase),
          const SettingsTileDivider(full: true),
          const ThemeSettingsSection(),

          /// Spacer
          const VerticalSpacer.large(),

          /// General app settings
          SettingsTileHeader(title: S.of(context).generalSettings.titleCase),
          const SettingsTileDivider(full: true),
          const GeneralSettingsSection(),

          /// Spacer
          const VerticalSpacer.large(),

          /// Templates settings
          SettingsTileHeader(title: S.of(context).surgeryTemplates.titleCase),
          const SettingsTileDivider(full: true),
          const TemplatesSettingsSection(),
          const VerticalSpacer.large(),

          /// Support app settings
          SettingsTileHeader(
            title: S.of(context).supportDataSettings.titleCase,
          ),
          const SettingsTileDivider(full: true),
          const SupportDataSettingsSection(),
          const VerticalSpacer.large(),

          /// Database app settings
          SettingsTileHeader(title: S.of(context).databaseSettings.titleCase),
          const SettingsTileDivider(full: true),
          const DatabaseSettingsSection(),
          const VerticalSpacer.large(),
        ],
      ),
    );
  }
}
