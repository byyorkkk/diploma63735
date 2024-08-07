import 'package:adhd_project/common/hooks/use_on_delete_item_listener.dart';
import 'package:adhd_project/common/util/delete_item_cubit.dart';
import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/tasks/delete_task_cubit.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:adhd_project/features/tasks/widgets/timeline/calendar_month_days_slider.dart';
import 'package:adhd_project/features/tasks/widgets/timeline/calendar_month_picker.dart';
import 'package:adhd_project/features/tasks/widgets/timeline/tasks_timeline.dart';
import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

class TasksScreen extends HookWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ADColors.of(context);

    final cubit = context.watch<TasksCubit>();
    final state = cubit.state;

    const loadingIndicator = Center(child: CircularProgressIndicator());

    final deleteCubit = useBloc(
      () => DeleteTaskCubit(context.read()),
    );

    useOnDeleteItemListener(deleteCubit, (event) {
      switch (event) {
        case DeleteItemSuccessEvent():
          showSuccessSnackbar(
            context: context,
            text: 'Successfully removed the task',
          );
        case DeleteItemErrorEvent():
          showErrorSnackbar(
            context: context,
            text: 'Failed to remove the task',
          );
      }
    });

    return Provider.value(
      value: deleteCubit,
      child: state.map(
        initial: (_) => loadingIndicator,
        loading: (_) => loadingIndicator,
        error: (_) => ADCommonErrorRefetchWidget(onRefetch: cubit.fetch),
        ready: (state) => Column(
          children: [
            const SizedBox(height: 16),
            CalendarMonthNavigation(date: state.selectedDay),
            const SizedBox(height: 32),
            CalendarMonthDaysSlider(selectedDay: state.selectedDay),
            const SizedBox(height: 8),
            if (state.selectedDayTasks.isNotEmpty)
              Expanded(
                child: TasksTimeline(
                  tasks: state.selectedDayTasks,
                  date: state.selectedDay,
                ),
              )
            else ...[
              const Spacer(),
              ADPicture(picture: Assets.pictures.light.tasksEmpty),
              const SizedBox(height: 32),
              ADText(
                'You have no task today!',
                style: ADTextStyle.h4,
                color: colors.primary,
              ),
              const SizedBox(height: 20),
              ADText(
                'Click the (+) icon to add a new task',
                style: ADTextStyle.bodyLarge.withWeight(ADFontWeight.medium),
              ),
              const Spacer(flex: 2),
            ],
          ],
        ),
      ),
    );
  }
}
