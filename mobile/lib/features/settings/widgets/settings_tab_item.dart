import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsTabItem extends StatelessWidget {
  const SettingsTabItem({
    super.key,
    required this.routeLocation,
    required this.title,
    required this.iconData,
  });

  final String routeLocation;
  final String title;
  final SvgGenImage iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(routeLocation),
      child: Row(
        children: [
          const SizedBox(width: 8),
          ADIcon(icon: iconData, size: 28),
          const SizedBox(width: 20),
          ADText(
            title,
            style: ADTextStyle.bodyXLarge.withWeight(ADFontWeight.semiBold),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
