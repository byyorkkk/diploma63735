import 'package:flutter/material.dart';

abstract class ADColors {
  static ADColors of(BuildContext context) => ADLightColors();

  // Neutral
  static const neutral900 = Color(0xFF111728);
  static const neutral800 = Color(0xFF1E2838);
  static const neutral700 = Color(0xFF353F53);
  static const neutral600 = Color(0xFF485366);
  static const neutral500 = Color(0xFF676F84);
  static const neutral400 = Color(0xFF98A2B3);
  static const neutral300 = Color(0xFFD0D5DD);
  static const neutral200 = Color(0xFFEAECF0);
  static const neutral100 = Color(0xFFF4F6F9);
  static const neutral50 = Color(0xFFF9FAFB);
  static const neutral25 = Color(0xFFFCFDFD);
  static const neutral0 = Color(0xFFFFFFFF);

  // Accent
  static const accent600 = Color(0xFF1570EF);
  static const accent500 = Color(0xFF2196F3);
  static const accent400 = Color(0xFF64B5F6);
  static const accent300 = Color(0xFFBBDEFB);
  static const accent200 = Color(0xFFE3F2FD);

  // Success
  static const success600 = Color(0xFF039855);
  static const success500 = Color(0xFF12B76A);
  static const success400 = Color(0xFF32D583);
  static const success300 = Color(0xFF6CE9A6);
  static const success200 = Color(0xFFA6F4C5);

  // Error
  static const error600 = Color(0xFFD72824);
  static const error500 = Color(0xFFEE413B);
  static const error400 = Color(0xFFFECDCA);
  static const error300 = Color(0xFFFDE4E2);
  static const error200 = Color(0xFFFEF3F2);

  // Warning
  static const warning600 = Color(0xFFF08715);
  static const warning500 = Color(0xFFF79009);
  static const warning400 = Color(0xFFFEC84B);
  static const warning300 = Color(0xFFFEDF89);
  static const warning200 = Color(0xFFFEF0C7);

  // Basic
  Color get primary;
  Color get secondary;
  Color get neutral;
  Color get neutralLight;
  Color get neutralLighter;
  Color get neutralDark;

  // Text
  Color get text;
  Color get textTetriary;
  Color get textOnPrimary;
  Color get textOnSecondary;

  // Info
  Color get warning;
  Color get error;
  Color get success;

  // Others
  Color get rippleColor;
  Color get outline;

  // New 2, 3, 7, 8, 9, [14]
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey700 = Color(0xFF616161);
  static const grey900 = Color(0xFF212121);
  static const white = Color(0xFFFFFFFF);
  static const primaryRed = Color(0xFFFF575C);
  static const primaryRedLight = Color(0xFFffa4a7);
  static const secondaryYellow = Color(0xFFFFDB58);

  Color get icon;
  Color get iconSecondary;
  Color get card;
  Color get textSecondary;
  Color get inputFieldBackground;

  Color get background;
  Color get backgroundSecondary;
  Color get backgroundTetriary;
}

class ADLightColors extends ADColors {
  @override
  Color get primary => ADColors.primaryRed;
  @override
  Color get secondary => ADColors.secondaryYellow;
  @override
  Color get neutral => ADColors.neutral500;
  @override
  Color get neutralLight => ADColors.neutral200;
  @override
  Color get neutralLighter => ADColors.neutral100;
  @override
  Color get neutralDark => ADColors.neutral700;

  @override
  Color get textTetriary => ADColors.neutral400;
  @override
  Color get textOnPrimary => ADColors.neutral0;
  @override
  Color get textOnSecondary => ADColors.neutral900;
  @override
  Color get inputFieldBackground => ADColors.grey50;

  @override
  Color get warning => ADColors.warning500;
  @override
  Color get error => ADColors.error500;
  @override
  Color get success => ADColors.success500;

  @override
  Color get rippleColor => ADColors.accent400;
  @override
  Color get outline => ADColors.accent500;

  @override
  Color get text => ADColors.neutral900;
  @override
  Color get icon => ADColors.grey900;
  @override
  Color get iconSecondary => ADColors.grey400;
  @override
  Color get card => ADColors.white;
  @override
  Color get textSecondary => ADColors.grey700;
  @override
  Color get background => ADColors.white;
  @override
  Color get backgroundSecondary => ADColors.grey200;
  @override
  Color get backgroundTetriary => ADColors.neutral300;
}
