import 'package:adhd_project/common/util/snackbars.dart';
import 'package:adhd_project/common/util/validators.dart';
import 'package:adhd_project/common/widgets/bottom_page_spacer.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/features/tasks/model/task_status.dart';
import 'package:adhd_project/features/tasks/task_form/task_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';

enum TaskFormScreenType { create, edit }

class TaskFormScreen extends HookWidget {
  const TaskFormScreen.create({
    super.key,
    required DateTime this.initialDateTime,
  })  : type = TaskFormScreenType.create,
        task = null;

  const TaskFormScreen.edit({
    super.key,
    required TaskDto this.task,
  })  : type = TaskFormScreenType.edit,
        initialDateTime = null;

  final TaskFormScreenType type;
  final TaskDto? task;
  final DateTime? initialDateTime;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc(() => TaskFormCubit(context.read()));
    final state = useBlocState(cubit);

    final initialStartDay = task?.startDay ?? initialDateTime!;

    useOnStreamChange(
      cubit.presentation,
      onData: (event) async {
        final typeText = type == TaskFormScreenType.create ? 'saved' : 'edited';
        switch (event) {
          case TaskFormSaveSuccessEvent():
            await showSuccessSnackbar(
              context: context,
              text: 'Successfully $typeText the task',
              async: true,
            );
            GoRouter.of(context).pop();
            return;

          case TaskFormSaveErrorEvent():
            showSuccessSnackbar(
              context: context,
              text: 'Failed to $typeText the task. Please try again later.',
            );
        }
      },
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController(text: task?.description);
    final status = useState(
      task?.taskStatus == null
          ? TaskStatus.notStarted
          : TaskStatus.fromValue(task!.taskStatus!),
    );

    final startDate = useState(initialStartDay);
    final endDate = useState(task?.deadlineDay);
    final startTime = useState(
      task == null
          // Now for startTime of create screen because [initialDateTime] time
          // will be always 12am
          ? TimeOfDay.now()
          : TimeOfDay.fromDateTime(task!.startDay!),
    );
    final endTime = useState(
      task == null ? null : TimeOfDay.fromDateTime(task!.deadlineDay!),
    );

    final startDateTime = _getDate(startDate.value, startTime.value);
    final endDateTime = _getDate(endDate.value, endTime.value);

    String? dateTimeValidation(Object? value) {
      if (value == null) {
        return 'Field required';
      }

      if (startDateTime == null || endDateTime == null) {
        return null;
      }

      if (!startDateTime.isBefore(endDateTime)) {
        return 'End must be after start';
      }

      return null;
    }

    final pomodoroSessions = useState(task?.pomodoroSessions ?? 1);

    return ADScaffold(
      wrapInSafeArea: false,
      safeAreaBottom: false,
      actionInProgress: state == TaskFormState.loading,
      appBar: ADAppBar(
        title: ADText(
          '${type == TaskFormScreenType.create ? 'Create a new' : 'Edit'} task',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              ADTextField(
                labelText: 'Name',
                validator: requiredFieldValidator,
                controller: nameController,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ADDateField(
                      labelText: 'Start Date',
                      value: startDate.value,
                      onValueChanged: (v) => startDate.value = v,
                      validator: requiredFieldValidator,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: ADTimeField(
                      labelText: 'Start Time',
                      value: startTime.value,
                      onValueChanged: (v) => startTime.value = v,
                      validator: requiredFieldValidator,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ADDateField(
                      labelText: 'End Date',
                      value: endDate.value,
                      onValueChanged: (v) => endDate.value = v,
                      validator: dateTimeValidation,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: ADTimeField(
                      labelText: 'End Time',
                      value: endTime.value,
                      onValueChanged: (v) => endTime.value = v,
                      validator: dateTimeValidation,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ADDropdown<TaskStatus>(
                items: TaskStatus.values,
                itemsBuilder: (v) => v.tr(),
                labelText: 'Task status',
                onChanged: (v) => status.value = v ?? status.value,
                value: status.value,
                validator: requiredFieldValidator,
              ),
              const SizedBox(height: 24),
              ADSlider(
                label: 'Working Sessions',
                max: 20,
                value: pomodoroSessions.value,
                onChange: (value) => pomodoroSessions.value = value,
              ),
              const SizedBox(height: 80),
              ADPrimaryButton(
                label: 'Save',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    switch (type) {
                      case TaskFormScreenType.create:
                        cubit.createTask(
                          startDate: startDateTime!,
                          endDate: endDateTime!,
                          status: status.value,
                          description: nameController.text,
                          pomodoroSessions: pomodoroSessions.value,
                        );
                        return;

                      case TaskFormScreenType.edit:
                        cubit.editTask(
                          task: task!,
                          status: status.value,
                          description: nameController.text,
                          pomodoroSessions: pomodoroSessions.value,
                          startDate: startDateTime!,
                          endDate: endDateTime!,
                        );
                        return;
                    }
                  }
                },
              ),
              const BottomPageSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime? _getDate(DateTime? date, TimeOfDay? time) {
  if (date == null || time == null) {
    return null;
  }
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}
