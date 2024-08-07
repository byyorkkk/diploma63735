import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

// class ADTheme {
//   static ThemeData light() => _build(
//         brightness: Brightness.light,
//         colorScheme: ADLightColors(),
//       );

//   static ThemeData _build({
//     required Brightness brightness,
//     required ADColors colorScheme,
//   }) {
//     return ThemeData.from(
//       colorScheme: ColorScheme(
//         primary: colorScheme.background,
//         secondary: colorScheme.secondary,
//         surface: colorScheme.background,
//         background: colorScheme.background,
//         error: colorScheme.error,
//         onPrimary: colorScheme.textOnPrimary,
//         onSecondary: colorScheme.background,
//         onSurface: colorScheme.background,
//         onBackground: colorScheme.background,
//         onError: colorScheme.textOnPrimary,
//         brightness: brightness,
//       ),
//     ).copyWith(
//       highlightColor: colorScheme.rippleColor,
//       hoverColor: colorScheme.rippleColor,
//       splashColor: colorScheme.rippleColor,
//       focusColor: colorScheme.rippleColor,
//     );
//   }
// }

class ADTheme {
  static const _primary = Colors.black;
  static const _secondary = ADColors.accent500;
  static const _surface = ADColors.neutral0;

  static ThemeData light() {
    return _build(
      primary: _primary,
      secondary: _secondary,
      lighterText: Colors.white,
      darkerText: Colors.black,
      surface: _surface,
      background: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark() {
    return _build(
      primary: _primary,
      secondary: _secondary,
      lighterText: Colors.white,
      darkerText: Colors.black,
      surface: _surface,
      background: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color lighterText,
    required Color darkerText,
    required Color surface,
    required Color background,
    required Color error,
    required Color onError,
  }) {
    return ThemeData.from(
      colorScheme: ColorScheme(
        primary: primary,
        secondary: secondary,
        surface: surface,
        background: background,
        error: error,
        onPrimary: lighterText,
        onSecondary: darkerText,
        onSurface: darkerText,
        onBackground: darkerText,
        onError: onError,
        brightness: brightness,
      ),
    );
  }
}
