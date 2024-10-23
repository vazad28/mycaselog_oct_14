import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class EmailSigninSubTitleWidget extends StatelessWidget {
  const EmailSigninSubTitleWidget({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(text)),
          const SizedBox(width: AppSpacing.md),
          const SizedBox(
            width: AppSpacing.xxxlg,
            child: AppLogo(),
          ),
        ],
      ),
    );
  }
}
