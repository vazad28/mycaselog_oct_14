import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../auth_flow/auth_flow.dart';
import '../user_profile.dart';

class SignOutButton extends ConsumerStatefulWidget {
  const SignOutButton({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends ConsumerState<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(signOutButtonNotifierProvider);

    return AppButton(
      text: loading ? null : S.of(context).signOut,
      onPressed: _signOut,
      cupertinoIcon: CupertinoIcons.arrow_right_circle,
      materialIcon: Icons.logout,
      buttonType: ButtonType.text,
      child: loading ? const Spinner() : null,
    );
  }

  Future<void> _signOut() async {
    try {
      ref.watch(signOutButtonNotifierProvider.notifier).update(value: true);
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      ref.watch(authFlowNotifierProvider.notifier).onLogoutRequested();
    } catch (err) {
      if (!mounted) return;
      ref.watch(signOutButtonNotifierProvider.notifier).update(value: false);
      context.showSnackBar(S.of(context).signOutFailure);
    }
  }
}
