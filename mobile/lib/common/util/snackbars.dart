import 'dart:async';

import 'package:adhd_project/design_system/ad_colors.dart';
import 'package:flutter/material.dart';

FutureOr<void> showSnackbar({
  required BuildContext context,
  required Widget content,
  required Color backgroundColor,
  bool async = false,
}) {
  const duration = Duration(seconds: 5);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      backgroundColor: backgroundColor,
      duration: duration,
    ),
  );

  if (async) {
    return Future<void>.delayed(duration);
  }
}

FutureOr<void> showErrorSnackbar({
  required BuildContext context,
  required String text,
  bool async = false,
}) =>
    showSnackbar(
      context: context,
      content: Text(text),
      backgroundColor: ADColors.of(context).error,
    );

FutureOr<void> showInfoSnackbar({
  required BuildContext context,
  required String text,
  bool async = false,
}) =>
    showSnackbar(
      context: context,
      content: Text(text),
      backgroundColor: ADColors.of(context).outline,
    );

FutureOr<void> showSuccessSnackbar({
  required BuildContext context,
  required String text,
  bool async = false,
}) =>
    showSnackbar(
      context: context,
      content: Text(text, style: const TextStyle(color: Colors.white)),
      backgroundColor: ADColors.of(context).success,
    );
