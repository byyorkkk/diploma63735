import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADTextFieldError extends StatelessWidget {
  const ADTextFieldError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final color = ADColors.of(context).error;

    return ADText(
      message,
      style: ADTextStyle.bodySmall,
      color: color,
    );
  }
}
