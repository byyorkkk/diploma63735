import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADButton extends StatelessWidget {
  const ADButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.leadingIcon,
    this.trailingIcon,
    this.border,
    this.expanded = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Border? border;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(100));
    const duration = Duration(milliseconds: 120);

    return AnimatedOpacity(
      duration: duration,
      opacity: onPressed != null ? 1 : 0.4,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPressed,
            customBorder: const RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingIcon != null) ...[
                    if (expanded)
                      Expanded(child: leadingIcon!)
                    else
                      leadingIcon!,
                    const SizedBox(width: 12),
                  ] else if (expanded)
                    const Spacer(),
                  ADText(
                    label,
                    style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.bold),
                    color: textColor,
                  ),
                  if (trailingIcon != null) ...[
                    const SizedBox(width: 12),
                    if (expanded)
                      Expanded(child: trailingIcon!)
                    else
                      trailingIcon!,
                  ] else if (expanded)
                    const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
