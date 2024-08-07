import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADSecondaryButton extends StatelessWidget {
  const ADSecondaryButton({
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
    final colors = ADColors.of(context);

    return ADButton(
      label: label,
      onPressed: onPressed,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      backgroundColor: colors.background,
      textColor: colors.textOnSecondary,
      border: Border.all(
        color: colors.backgroundTetriary,
        width: 2,
      ),
    );
  }
}
