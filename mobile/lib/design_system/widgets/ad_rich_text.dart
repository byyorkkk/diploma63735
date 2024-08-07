import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

/// By default uses `AdTextStyle.regular` and `AdColors.text`
class ADRichText extends StatelessWidget {
  const ADRichText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final ADTextSpan data;
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

    return RichText(
      text: TextSpan(
        style: effectiveStyle,
        children: [data],
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines ?? DefaultTextStyle.of(context).maxLines,
    );
  }
}

class ADTextSpan extends TextSpan {
  ADTextSpan({
    super.text,
    super.children = const [],
    super.recognizer,
    ADTextStyle? style,
    Color? color,
  }) : super(style: style?.copyWith(color: color));
}
