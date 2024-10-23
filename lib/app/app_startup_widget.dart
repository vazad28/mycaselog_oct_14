import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_flow/auth_flow.dart';

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    required this.onAuthentication,
    required this.needsAuthentication,
    super.key,
  });

  final WidgetBuilder onAuthentication;
  final WidgetBuilder needsAuthentication;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUserState = ref.watch(authFlowNotifierProvider);

    return authUserState.maybeWhen(
      authenticated: () => onAuthentication(context),
      orElse: () => needsAuthentication(context),
    );
  }
}
