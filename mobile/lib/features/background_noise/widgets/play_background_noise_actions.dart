import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/background_noise/play_background_noise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PlayBackgroundNoiseActions extends StatelessWidget {
  const PlayBackgroundNoiseActions({
    super.key,
    required this.state,
  });

  final PlayBackgroundNoiseLoaded state;

  @override
  Widget build(BuildContext context) {
    final status = () {
      if (state.playerData.playerState == ProcessingState.completed) {
        return ADPlayerStatus.finished;
      }
      if (state.playerData.playerState == ProcessingState.ready) {
        if (state.playerData.playing) {
          return ADPlayerStatus.playing;
        }
        return ADPlayerStatus.paused;
      }
      return ADPlayerStatus.idle;
    }();

    void onPressed() {
      final cubit = context.read<PlayBackgroundNoiseCubit>();

      if (status == ADPlayerStatus.playing) {
        cubit.pause();
      } else if ([ADPlayerStatus.idle, ADPlayerStatus.paused]
          .contains(status)) {
        cubit.play();
      }
    }

    final resetButton = ADPlayerSecondaryButton(
      icon: ADIcon(icon: Assets.icons.x24.reset),
      onPressed: context.read<PlayBackgroundNoiseCubit>().reset,
    );

    return Row(
      children: [
        if (status == ADPlayerStatus.paused)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: resetButton,
            ),
          )
        else
          const Spacer(),
        if (status != ADPlayerStatus.finished) ...[
          const SizedBox(width: 20),
          ADPlayerPrimaryButton(
            status: status,
            onPressed: onPressed,
          ),
          const SizedBox(width: 20),
        ] else
          resetButton,
        const Spacer(),
      ],
    );
  }
}
