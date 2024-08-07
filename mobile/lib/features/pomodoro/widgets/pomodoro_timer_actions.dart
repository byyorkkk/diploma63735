import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_session_cubit.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_timer_cubit.dart';
import 'package:adhd_project/features/pomodoro/model/pomodoro_options.dart';
import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PomodoroTimerActions extends StatelessWidget {
  const PomodoroTimerActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PomodoroTimerCubit>();
    final state = cubit.state;
    final sessionCubit = context.watch<PomodoroSessionCubit>();
    final sessionState = sessionCubit.state;

    final showReset = cubit.state.map(
      idle: (_) => false,
      running: (state) => switch (state.status) {
        PomodoroTimerRunningStatus.running => false,
        PomodoroTimerRunningStatus.paused => true,
        PomodoroTimerRunningStatus.finished => true,
      },
    );
    final showStop = cubit.state.map(
      idle: (_) => false,
      running: (state) => switch (state.status) {
        PomodoroTimerRunningStatus.running => true,
        PomodoroTimerRunningStatus.paused => true,
        PomodoroTimerRunningStatus.finished => false,
      },
    );

    return Row(
      children: [
        if (showReset)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ADPlayerSecondaryButton(
                icon: ADIcon(icon: Assets.icons.x24.reset),
                onPressed: cubit.reset,
              ),
            ),
          )
        else
          const Spacer(),
        const SizedBox(width: 20),
        if (sessionState.awaitsPickingBreakLengthOption &&
            (state is PomodoroTimerRunning && state.finished)) ...[
          const PomodoroBreakOptionButton(isShort: true),
          const SizedBox(width: 20),
          const PomodoroBreakOptionButton(isShort: false),
        ] else
          const PomodoroPrimaryActionButton(),
        const SizedBox(width: 20),
        if (showStop)
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ADPlayerSecondaryButton(
                icon: ADIcon(icon: Assets.icons.x24.stop),
                onPressed: cubit.stop,
              ),
            ),
          )
        else
          const Spacer(),
      ],
    );
  }
}

class PomodoroPrimaryActionButton extends StatelessWidget {
  const PomodoroPrimaryActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PomodoroTimerCubit>();
    final state = cubit.state;

    final status = state.map(
      idle: (_) => ADPlayerStatus.idle,
      running: (state) => switch (state.status) {
        PomodoroTimerRunningStatus.running => ADPlayerStatus.playing,
        PomodoroTimerRunningStatus.paused => ADPlayerStatus.paused,
        PomodoroTimerRunningStatus.finished => ADPlayerStatus.finished,
      },
    );
    final onPressed = state.map(
      idle: (_) => cubit.start,
      running: (state) => switch (state.status) {
        PomodoroTimerRunningStatus.running => cubit.pause,
        PomodoroTimerRunningStatus.paused => cubit.resume,
        PomodoroTimerRunningStatus.finished => cubit.start,
      },
    );

    return ADPlayerPrimaryButton(
      onPressed: onPressed,
      status: status,
    );
  }
}

class PomodoroBreakOptionButton extends StatelessWidget {
  const PomodoroBreakOptionButton({
    super.key,
    required this.isShort,
  });

  final bool isShort;

  static const size = 80.0;

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<SettingsCubit>().state;

    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: size + 24,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isShort
                      ? const Color(0xff14a870)
                      : const Color(0xff1154bf),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () =>
                      context.read<PomodoroTimerCubit>().changePomodoroOption(
                            isShort
                                ? PomodoroOption.shortBreak
                                : PomodoroOption.longBreak,
                          ),
                  child: Stack(
                    children: [
                      Center(
                        child: ADText(
                          isShort
                              ? '${settingsState.pomodoroShortBreakDuration.inMinutes}'
                              : '${settingsState.pomodoroLongBreakDuration.inMinutes}',
                          style: ADTextStyle.h1
                              .withSize(16)
                              .withAbsoluteLineHeight(20),
                          textAlign: TextAlign.center,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: ADIcon(
                          icon: isShort
                              ? Assets.icons.x24.shortBreakDurationBorder
                              : Assets.icons.x24.longBreakDurationBorder,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: size,
              bottom: null,
              child: ADText(
                isShort ? 'Short Break' : 'Long Break',
                style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.medium),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
