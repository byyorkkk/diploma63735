import 'package:flutter/material.dart';

abstract class ADShadows {
  static ADShadows of(BuildContext context) => ADLightShadows();

  List<BoxShadow> get cardShadow2;
  List<BoxShadow> get bottomNarBar;
}

class ADLightShadows extends ADShadows {
  @override
  List<BoxShadow> get cardShadow2 => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 60,
          color: const Color(0xFF060F0D).withOpacity(0.05),
        ),
      ];
  @override
  List<BoxShadow> get bottomNarBar => [
        BoxShadow(
          offset: const Offset(0, 8),
          blurRadius: 24,
          color: const Color(0xFF9E9E9E).withOpacity(0.4),
        ),
      ];
}
