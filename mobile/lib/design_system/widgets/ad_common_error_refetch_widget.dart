import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class ADCommonErrorRefetchWidget extends StatelessWidget {
  const ADCommonErrorRefetchWidget({
    super.key,
    required this.onRefetch,
  });

  final VoidCallback onRefetch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ADText(
          'Unknown error ocurred',
          style: ADTextStyle.bodyMedium,
        ),
        const SizedBox(height: 16),
        ADPrimaryButton(label: 'Retry', onPressed: onRefetch),
      ],
    );
  }
}
