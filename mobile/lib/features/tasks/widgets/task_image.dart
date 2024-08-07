import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class TaskImage extends StatelessWidget {
  const TaskImage({
    super.key,
    required this.icon,
    required this.color,
  });

  final ADIcon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: icon,
    );
  }
}
