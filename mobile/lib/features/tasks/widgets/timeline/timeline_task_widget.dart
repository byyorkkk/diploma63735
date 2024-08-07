import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_session_cubit.dart';
import 'package:adhd_project/features/tasks/delete_task_cubit.dart';
import 'package:adhd_project/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TimelineTaskWidget extends HookWidget {
  const TimelineTaskWidget({
    super.key,
    required this.task,
    required this.backgroundColor,
  });

  final TaskDto task;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final timeFormat = useMemoized(
      () => DateFormat.Hm(Localizations.localeOf(context).countryCode),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsiveness calculations
        final height = constraints.maxHeight;
        const titleStyle = ADTextStyle.h6;
        final durationStyle =
            ADTextStyle.bodyMedium.withWeight(ADFontWeight.medium);

        const minPadding = 4.0;
        const mediumPadding = 8.0;
        const standardPadding = 16.0;
        const titleToDurationSpace = 6.0;

        // Additional 2px as a buffor to ensure there would be no overflow errors
        final titleOneLineHeight =
            titleStyle.height! * titleStyle.fontSize! + 2;
        final oneLinerMinHeight = titleOneLineHeight + 2 * minPadding;

        final multilinerWithoutDurationMinHeight =
            oneLinerMinHeight + 2 * (mediumPadding - minPadding);

        final standardWidgetMinHeight = multilinerWithoutDurationMinHeight +
            2 * (standardPadding - mediumPadding) +
            titleToDurationSpace +
            durationStyle.height! * durationStyle.fontSize!;

        final size = switch (height) {
          _ when height < oneLinerMinHeight => _TimelineTaskSize.minimal,
          _ when height < multilinerWithoutDurationMinHeight =>
            _TimelineTaskSize.oneliner,
          _ when height < standardWidgetMinHeight =>
            _TimelineTaskSize.multilinerWithoutDuration,
          _ => _TimelineTaskSize.standard,
        };

        return InkWell(
          onTap: () {
            context
                .read<PomodoroSessionCubit>()
                .startSession(task, task.pomodoroSessions!);
            GoRouter.of(context).push(PomodoroRoute<void>().location);
          },
          onLongPress: () {
            GoRouter.of(context).push(
              EditTaskRoute<void>(taskId: task.id!).location,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: size != _TimelineTaskSize.standard
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.padding),
                    if (size != _TimelineTaskSize.minimal)
                      Padding(
                        padding: EdgeInsets.only(
                          right: size == _TimelineTaskSize.standard ? 24 : 0,
                        ),
                        child: ADAutoSizeText(
                          task.description!,
                          style: titleStyle,
                          color: ADColors.white,
                          maxLines: size == _TimelineTaskSize.oneliner ? 1 : 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (size == _TimelineTaskSize.standard) ...[
                      const SizedBox(height: 6),
                      ADAutoSizeText(
                        '${timeFormat.format(task.startDay!)} - ${timeFormat.format(task.deadlineDay!)}',
                        style: durationStyle,
                        color: ADColors.white,
                      ),
                    ],
                    SizedBox(height: size.padding),
                  ],
                ),
                if (size == _TimelineTaskSize.standard)
                  Positioned(
                    right: -16,
                    top: 4,
                    child: ADEditDeleteOptionsButton(
                      itemType: ADConfirmDeleteItemType.task,
                      onEditPressed: () => GoRouter.of(context).push(
                        EditTaskRoute<void>(
                          taskId: task.id!,
                        ).location,
                      ),
                      onDeletePressed: () =>
                          context.read<DeleteTaskCubit>().delete(task),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum _TimelineTaskSize {
  minimal(0),
  oneliner(4),
  multilinerWithoutDuration(8),
  standard(16);

  const _TimelineTaskSize(this.padding);

  final double padding;
}
