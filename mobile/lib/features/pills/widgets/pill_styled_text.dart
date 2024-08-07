import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class PillStyledText extends StatelessWidget {
  const PillStyledText({
    super.key,
    required this.pill,
  });

  final PillDto pill;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ADIcon(
          icon: Assets.icons.x24.pill,
          size: 16,
        ),
        const SizedBox(width: 4),
        ADRichText(
          ADTextSpan(
            text: pill.pillName,
            children: [
              const TextSpan(text: ' '),
              ADTextSpan(
                text: '(${pill.pillDose})',
                style: ADTextStyle.bodyXSmall,
                color: colors.textSecondary,
              ),
            ],
          ),
          style: ADTextStyle.bodyMedium,
          color: colors.text,
        ),
      ],
    );
  }
}
