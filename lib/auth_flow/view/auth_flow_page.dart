import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../onboarding/onboarding.dart';
import '../../router/router.dart';
import '../../signin/signin.dart';
import '../auth_flow.dart';

class AuthFlowPage extends ConsumerWidget {
  const AuthFlowPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: AuthFlowPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlowBuilder(
      state: ref.watch(authFlowNotifierProvider),
      onGeneratePages: (authState, List<Page<dynamic>> pages) {
        //debugPrint('authState in authFlow $authState');
        return authState.when(
          unboarded: () => [
            SharedAxisTransitionPage(
              key: const ValueKey('__AuthFlowPage_OnboardingPage_route_key__'),
              child: const OnboardingPage(),
            ),
          ],
          authenticated: () => [
            SharedAxisTransitionPage(
              key: const ValueKey(
                  '__AuthFlowPage_AuthenticatedPage_route_key__'),
              child: const SizedBox.shrink(),
            ),
          ],
          unauthenticated: () => [
            SharedAxisTransitionPage(
              key: const ValueKey('__AuthFlowPage_SigninPage_route_key__'),
              child: const SigninPage(),
            ),
          ],
          // authorized: () => [
          //   const NoTransitionPage(
          //     key: ValueKey('__AuthFlowPage_SplashPage_route_key__'),
          //     child: SizedBox.shrink(),
          //   ),
          // ],
        );
      },
    );
  }
}
