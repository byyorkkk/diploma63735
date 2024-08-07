import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_session_cubit.dart';
import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:adhd_project/features/tasks/widgets/task_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PomodoroTaskWidget extends StatelessWidget {
  const PomodoroTaskWidget({
    super.key,
    required this.task,
  });

  final TaskDto task;

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);
    final shadows = ADShadows.of(context);

    final sessionState = context.watch<PomodoroSessionCubit>().state;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadows.cardShadow2,
      ),
      child: Row(
        children: [
          TaskImage(
            icon: ADIcon(
              icon: Assets.icons.moreCircle,
              color: ADColors.white,
            ),
            color: const Color(0xFF4AAF57),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADText(
                  task.description!,
                  style: ADTextStyle.h5,
                ),
                const SizedBox(height: 8),
                ADText(
                  '120 minutes',
                  style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.medium),
                  color: colors.textSecondary,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ADText(
                '${sessionState.currentRound}/${sessionState.roundsCount}',
                style: ADTextStyle.h5,
              ),
              const SizedBox(height: 8),
              ADText(
                '${context.read<SettingsCubit>().state.pomodoroRoundDuration.inMinutes} minutes',
                style: ADTextStyle.bodyMedium.withWeight(ADFontWeight.medium),
                color: colors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
