import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADBackButton extends StatelessWidget {
  const ADBackButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ADIconButton(
      icon: ADIcon(icon: Assets.icons.arrowLeft),
      onPressed: onPressed ?? Navigator.of(context).maybePop,
    );
  }
}
