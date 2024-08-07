import 'dart:async';
import 'dart:math';

import 'package:adhd_project/common/util/duration_formatter.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/background_noise/model/background_noise.dart';
import 'package:adhd_project/features/background_noise/play_background_noise_cubit.dart';
import 'package:adhd_project/features/background_noise/widgets/play_background_noise_actions.dart';
import 'package:adhd_project/l10n/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PlayBackgroundNoiseScreen extends HookWidget {
  const PlayBackgroundNoiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);
    final colors = ADColors.of(context);

    final cubit = context.watch<PlayBackgroundNoiseCubit>();
    final state = cubit.state;
    final duration =
        state.mapOrNull(loaded: (state) => state.playerData.duration);
    final progress =
        state.mapOrNull(loaded: (state) => state.playerData.position);

    void loadAudio(Duration duration) {
      final version = BackgroundNoiseVersion(
        duration: duration,
        assetPath: Assets.whiteNoise,
      );
      final backgroundNoise = BackgroundNoise(
        name: 'White noise',
        versions: [version],
      );
      cubit.load(
        backgroundNoise: backgroundNoise,
        version: version,
      );
    }

    final pickedDurationOption = useState<int?>(null);

    final max = duration?.inMilliseconds.toDouble() ?? 1;
    final initialValue = min(max, progress?.inMilliseconds.toDouble() ?? 0);

    return WillPopScope(
      onWillPop: () async {
        unawaited(cubit.clear());
        return true;
      },
      child: ADScaffold(
        actionInProgress: state is PlayBackgroundNoiseLoading,
        appBar: ADAppBar(
          title: ADText(s.backgroundNoise_Title),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      angleRange: 360,
                      startAngle: 270,
                      counterClockwise: true,
                      animationEnabled: false,
                      customColors: CustomSliderColors(
                        trackColor: colors.backgroundSecondary,
                        hideShadow: true,
                        dynamicGradient: true,
                        progressBarColor: colors.primary,
                      ),
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 24,
                        trackWidth: 24,
                      ),
                    ),
                    max: max,
                    initialValue: initialValue,
                    innerWidget: (_) => Center(
                      child: ADText(
                        DurationFormatter.formatMmSs(
                          duration == null || progress == null
                              ? Duration.zero
                              : duration - progress,
                        ),
                        style: ADTextStyle.pomodoro,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (state is PlayBackgroundNoiseLoaded)
                PlayBackgroundNoiseActions(state: state)
              else
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 240),
                  child: ADDropdown<int>(
                    items: const [3, 5, 10],
                    centerLabel: true,
                    itemsBuilder: (e) => e.toString(),
                    value: pickedDurationOption.value,
                    onChanged: (value) {
                      if (value != null) {
                        pickedDurationOption.value = value;
                        loadAudio(Duration(minutes: value));
                      }
                    },
                    labelText: 'Select duration',
                  ),
                ),
              if (state is PlayBackgroundNoiseError)
                ADCommonErrorRefetchWidget(onRefetch: cubit.clear),
            ],
          ),
        ),
      ),
    );
  }
}
