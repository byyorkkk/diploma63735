import 'dart:math';

import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

class BottomPageSpacer extends StatelessWidget {
  const BottomPageSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: max(
        MediaQuery.paddingOf(context).bottom,
        ADScaffold.bottomMinimumSafeArea,
      ),
    );
  }
}
