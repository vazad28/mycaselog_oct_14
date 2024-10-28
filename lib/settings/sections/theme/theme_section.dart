import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../../app/app.dart';

part './tiles/theme_mode_tile.dart';

class ThemeSettingsSection extends StatelessWidget {
  const ThemeSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpacer.normal(),
        ThemeModeSettingTile(),
        // LanguageSettingTile(),
        // FontSettingTile(),
        //AppColorTile(),
      ],
    );
  }
}
