import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADTetriaryButton extends StatelessWidget {
  const ADTetriaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ADButton(
      label: label,
      onPressed: onPressed,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      backgroundColor: Colors.transparent,
      textColor: ADColors.of(context).icon,
      expanded: false,
    );
  }
}
