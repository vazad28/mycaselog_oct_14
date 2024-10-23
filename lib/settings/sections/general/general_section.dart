import 'package:annotations/annotations.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../../shared/shared.dart';
import '../../settings.dart';

part 'tiles/case_navigate_to_tile.dart';
part 'tiles/local_auth_enabled.dart';
part 'tiles/sync_on_app_start_tile.dart';

class GeneralSettingsSection extends ConsumerWidget {
  const GeneralSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        VerticalSpacer.normal(),
        SyncDataOnAppStartTile(),
        LocalAuthEnabledTile(),
        CaseNavigateToTile(),
      ],
    );
  }
}
