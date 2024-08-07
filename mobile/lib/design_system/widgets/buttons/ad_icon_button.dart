import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADIconButton extends StatelessWidget {
  const ADIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.splashRadius,
    this.text,
  });

  ADIconButton.svg({
    super.key,
    required SvgGenImage icon,
    Color? iconColor,
    double size = 28,
    this.onPressed,
    this.splashRadius,
    this.text,
  }) : icon = ADIcon(
          icon: icon,
          color: iconColor,
          size: size,
        );

  final ADIcon icon;
  final VoidCallback? onPressed;
  final double? splashRadius;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final splashRadius = this.splashRadius;

    return TextButton(
      style: TextButton.styleFrom().copyWith(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
        fixedSize: splashRadius == null
            ? null
            : MaterialStatePropertyAll(
                Size(
                  text == null ? splashRadius * 2 : double.infinity,
                  splashRadius * 2,
                ),
              ),
      ),
      onPressed: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            if (text != null) ...[
              const SizedBox(width: 8),
              ADText(
                text!,
                style: ADTextStyle.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CustomInkFactory extends InteractiveInkFeatureFactory {
  const CustomInkFactory({this.customRadius = 16});

  final double? customRadius;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    // Ignored
    double? radius,
    ShapeBorder? customBorder,
    VoidCallback? onRemoved,
  }) {
    return InkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: customRadius,
      onRemoved: onRemoved,
      textDirection: textDirection,
    );
  }
}
