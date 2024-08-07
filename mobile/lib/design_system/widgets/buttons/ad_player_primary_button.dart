import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/material.dart';

enum ADPlayerStatus { idle, playing, paused, finished, stopped }

class ADPlayerPrimaryButton extends StatelessWidget {
  const ADPlayerPrimaryButton({
    super.key,
    this.size = 100,
    required this.status,
    required this.onPressed,
  });

  final double size;
  final ADPlayerStatus status;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final gradient = switch (status) {
      ADPlayerStatus.idle => ADGradients.green,
      ADPlayerStatus.playing => ADGradients.red,
      ADPlayerStatus.paused => ADGradients.green,
      ADPlayerStatus.finished => ADGradients.green,
      ADPlayerStatus.stopped => ADGradients.green,
    };
    final icon = switch (status) {
      ADPlayerStatus.idle => Assets.icons.x24.play,
      ADPlayerStatus.playing => Assets.icons.x24.pause,
      ADPlayerStatus.paused => Assets.icons.x24.play,
      ADPlayerStatus.finished => Assets.icons.x24.done,
      ADPlayerStatus.stopped => Assets.icons.x24.reset,
    };

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: onPressed == null ? ADGradients.grey : gradient,
          ),
          child: Center(
            child: ADIcon(
              icon: icon,
              color: ADColors.white,
              size: 32,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
