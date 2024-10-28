import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/models.dart';

import '../provider/user_profile_provider.dart';

/// User Mini widget
class UserMiniStatsWidget extends ConsumerWidget {
  const UserMiniStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userMiniStatsData = ref.watch(userMiniStatsProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 68, maxWidth: 300),
      child: statsTile(context, userMiniStatsData),
    );
  }

  Widget _label(String text, TextStyle? style) {
    return Expanded(
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget _data(String text, TextStyle? style) {
    return Expanded(
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget statsTile(BuildContext context, UserStatsModel stats) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.bodyMedium;
    final dataStyle = textTheme.headlineSmall;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _label('Cases', labelStyle),
            _label('Media', labelStyle),
            _label('Notes', labelStyle),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _data(stats.cases.toString(), dataStyle),
            _data(stats.media.toString(), dataStyle),
            _data(stats.notes.toString(), dataStyle),
          ],
        ),
      ],
    );
  }
}
