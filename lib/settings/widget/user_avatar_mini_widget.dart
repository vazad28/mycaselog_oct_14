import 'package:flutter/material.dart';
import 'package:flutter_logger_plus/flutter_logger_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:ui/ui.dart';

import '../../shared/providers/providers.dart';

class UserAvatarMiniWidget extends ConsumerWidget {
  const UserAvatarMiniWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationUser = ref.watch(authenticationUserProvider);

    final avatarWidget = authenticationUser.photo == null
        ? const Icon(
            Icons.person,
            size: kMinInteractiveDimension,
          )
        : FadeInImageWithPlaceholder(
            image: MediaCacheManager(
              authenticationUser.photo!,
              errorListener: logger.error,
            ),
            placeholder: const Spinner(
              dimension: kMinInteractiveDimension * 0.5,
            ),
            fit: BoxFit.cover,
          );

    return ClipOval(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(200),
        child: SizedBox.square(
          dimension: kMinInteractiveDimension,
          child: avatarWidget,
        ),
      ),
    );
  }
}
