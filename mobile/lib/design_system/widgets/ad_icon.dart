import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADIcon extends StatelessWidget {
  const ADIcon({
    super.key,
    required this.icon,
    this.size,
    this.color,
  });

  final SvgGenImage icon;
  final double? size;
  final Color? color;

  ADIcon withColor(Color color) {
    return ADIcon(
      icon: icon,
      size: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? ADColors.of(context).icon;
    final effectiveSize = size ?? (icon.path.contains('x24') ? 24 : 28);

    return icon.svg(
      width: size,
      height: effectiveSize,
      colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
    );
  }
}
