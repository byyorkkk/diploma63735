import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class SettingsCheckboxItem extends StatelessWidget {
  const SettingsCheckboxItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ADText(
          title,
          style: ADTextStyle.bodyXLarge.withWeight(ADFontWeight.semiBold),
        ),
        const Spacer(),
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          value: value,
          onChanged: (_) => onChanged(!value),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
