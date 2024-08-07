import 'package:adhd_project/common/util/duration_formatter.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_session_cubit.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_timer_cubit.dart';
import 'package:adhd_project/features/pomodoro/model/pomodoro_options.dart';
import 'package:adhd_project/features/pomodoro/widgets/pomodoro_task_widget.dart';
import 'package:adhd_project/features/pomodoro/widgets/pomodoro_timer_actions.dart';
import 'package:adhd_project/l10n/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PomodoroScreen extends HookWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);
    final colors = ADColors.of(context);

    final sessionState = context.watch<PomodoroSessionCubit>().state;
    final timerState = context.watch<PomodoroTimerCubit>().state;

    final task = sessionState.task;

    final totalDuration = timerState.pickedOption.duration;
    final timeLeft = timerState.map(
      idle: (state) => state.pickedOption.duration,
      running: (state) => state.timeLeft,
    );
    final value = (totalDuration - timeLeft).inMilliseconds;

    // TODO: Intl, refine translations
    final sessionTypeText = timerState.map(
      idle: (state) => 'Start round ${state.pickedOption.option.name}',
      running: (state) => state.pickedOption.option == PomodoroOption.pomodoro
          ? 'Get to work'
          : 'GO rest ;)',
    );

    return ADScaffold(
      appBar: ADAppBar(
        title: ADText(s.pomodoro_Timer_Title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            if (task != null) ...[
              const SizedBox(height: 24),
              PomodoroTaskWidget(task: task),
            ],
            const SizedBox(height: 24),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    angleRange: 360,
                    animationEnabled: false,
                    startAngle: 270,
                    customColors: CustomSliderColors(
                      trackColor: colors.backgroundSecondary,
                      hideShadow: true,
                      dynamicGradient: true,
                      progressBarColor: timerState.pickedOption.option.color,
                    ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 24,
                      trackWidth: 24,
                    ),
                  ),
                  max: totalDuration.inMilliseconds.toDouble(),
                  initialValue: value.toDouble(),
                  innerWidget: (_) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 24),
                        ADText(
                          DurationFormatter.formatMmSs(timeLeft),
                          style: ADTextStyle.pomodoro,
                        ),
                        const SizedBox(height: 4),
                        ADText(
                          sessionTypeText,
                          style: ADTextStyle.bodyXLarge.withWeight(
                            ADFontWeight.regular,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ADText(
                          s.pomodoro_Timer_SessionOutOf(
                            sessionState.currentRound,
                            sessionState.roundsCount,
                          ),
                          style: ADTextStyle.bodyMedium
                              .withWeight(ADFontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const PomodoroTimerActions(),
          ],
        ),
      ),
    );
  }
}
