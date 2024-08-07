import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// By default uses `AdTextStyle.regular` and `AdColors.text`
class ADAutoSizeText extends StatelessWidget {
  const ADAutoSizeText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String data;
  final ADTextStyle? style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? ADColors.of(context).text;
    final effectiveStyle =
        (style ?? DefaultTextStyle.of(context).style).copyWith(
      color: effectiveColor,
    );

    return AutoSizeText(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines ?? DefaultTextStyle.of(context).maxLines,
    );
  }
}
