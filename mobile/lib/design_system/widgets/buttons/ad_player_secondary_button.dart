import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADPlayerSecondaryButton extends StatelessWidget {
  const ADPlayerSecondaryButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final ADIcon icon;
  final VoidCallback? onPressed;

  static const size = 56.0;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.backgroundSecondary,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Center(
            child: icon.withColor(
              colors.iconSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
