import 'package:flutter/material.dart';

enum ADFontWeight { regular, medium, semiBold, bold }

class ADTextStyle extends TextStyle {
  const ADTextStyle._({
    required double super.fontSize,
    required FontWeight weight,
    double? absoluteLineHeight,
    super.letterSpacing,
    super.decoration,
  }) : super(
          fontFamily: _familyName,
          fontWeight: weight,
          height:
              absoluteLineHeight != null ? absoluteLineHeight / fontSize : null,
        );

  static const _familyName = 'Urbanist';

  static const _weightRegular = FontWeight.w400;
  static const _weightMedium = FontWeight.w500;
  static const _weightSemiBold = FontWeight.w600;
  static const _weightBold = FontWeight.w700;

  // Too many weight options in DS to keep it separately per weight
  ADTextStyle _copyWith({
    ADFontWeight? weight,
    TextDecoration? decoration,
    double? size,
    double? absoluteLineHeight,
  }) {
    return ADTextStyle._(
      fontSize: size ?? fontSize!,
      absoluteLineHeight: absoluteLineHeight ?? (height! * fontSize!),
      decoration: decoration,
      letterSpacing: letterSpacing,
      weight: weight == null
          ? (fontWeight ?? _weightRegular)
          : switch (weight) {
              ADFontWeight.regular => _weightRegular,
              ADFontWeight.medium => _weightMedium,
              ADFontWeight.semiBold => _weightSemiBold,
              ADFontWeight.bold => _weightBold,
            },
    );
  }

  ADTextStyle withWeight(ADFontWeight weight) => _copyWith(weight: weight);
  ADTextStyle withSize(double size) => _copyWith(size: size);
  ADTextStyle withAbsoluteLineHeight(double absoluteLineHeight) =>
      _copyWith(absoluteLineHeight: absoluteLineHeight);

  ADTextStyle withDecoration(TextDecoration decoration) => _copyWith(
        decoration: decoration,
      );

  static const h1 = ADTextStyle._(
    fontSize: 48,
    absoluteLineHeight: 52.8,
    weight: _weightBold,
  );
  static const h2 = ADTextStyle._(
    fontSize: 40,
    absoluteLineHeight: 44,
    weight: _weightBold,
  );
  static const h3 = ADTextStyle._(
    fontSize: 32,
    absoluteLineHeight: 35.2,
    weight: _weightBold,
  );
  static const h4 = ADTextStyle._(
    fontSize: 24,
    absoluteLineHeight: 28.8,
    weight: _weightBold,
  );
  static const h5 = ADTextStyle._(
    fontSize: 20,
    absoluteLineHeight: 24,
    weight: _weightBold,
  );
  static const h6 = ADTextStyle._(
    fontSize: 18,
    absoluteLineHeight: 21.6,
    weight: _weightBold,
  );

  static const bodyXLarge = ADTextStyle._(
    fontSize: 18,
    absoluteLineHeight: 25.2,
    weight: _weightRegular,
  );
  static const bodyLarge = ADTextStyle._(
    fontSize: 16,
    absoluteLineHeight: 22.4,
    weight: _weightRegular,
  );
  static const bodyMedium = ADTextStyle._(
    fontSize: 14,
    absoluteLineHeight: 16.8,
    weight: _weightRegular,
  );
  static const bodySmall = ADTextStyle._(
    fontSize: 12,
    absoluteLineHeight: 14.4,
    weight: _weightRegular,
  );
  static const bodyXSmall = ADTextStyle._(
    fontSize: 10,
    absoluteLineHeight: 12,
    weight: _weightRegular,
  );

  // Custom feature styles
  static const pomodoro = ADTextStyle._(
    fontSize: 60,
    absoluteLineHeight: 66,
    weight: _weightBold,
  );
}
