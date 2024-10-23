import 'package:flutter/material.dart';

import '../../../ui.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer.xsmall({this.height = AppSpacing.xs, super.key});
  const VerticalSpacer.small({this.height = AppSpacing.sm, super.key});
  const VerticalSpacer.normal({this.height = AppSpacing.md, super.key});
  const VerticalSpacer.large({this.height = AppSpacing.lg, super.key});
  const VerticalSpacer.xlarge({this.height = AppSpacing.xlg, super.key});
  const VerticalSpacer.xxlarge({this.height = AppSpacing.xxlg, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer.xsmall({this.width = AppSpacing.xs, super.key});
  const HorizontalSpacer.small({this.width = AppSpacing.sm, super.key});
  const HorizontalSpacer.normal({this.width = AppSpacing.md, super.key});
  const HorizontalSpacer.large({this.width = AppSpacing.lg, super.key});
  const HorizontalSpacer.xlarge({this.width = AppSpacing.xlg, super.key});
  const HorizontalSpacer.xxlarge({this.width = AppSpacing.xxlg, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
