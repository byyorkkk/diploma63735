import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/tasks/model/task_status.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;

class TaskFormCubit extends Cubit<TaskFormState>
    with
        BlocPresentationMixin<TaskFormState, TaskFormSaveEvent>,
        comms.Sender<TasksChangedMessage> {
  TaskFormCubit(this._api) : super(TaskFormState.idle);

  final AdApi _api;

  Future<void> createTask({
    required TaskStatus status,
    required String description,
    required int pomodoroSessions,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    emit(TaskFormState.loading);

    final res = await _api.apiTasksNewPost(
      body: TaskDto(
        description: description,
        pomodoroSessions: pomodoroSessions,
        startDay: startDate,
        deadlineDay: endDate,
        taskStatus: status.backendEnumValue,
      ),
    );

    if (res.isSuccessful) {
      send(TasksChangedMessage());
      emitPresentation(TaskFormSaveSuccessEvent());
    } else {
      emitPresentation(TaskFormSaveErrorEvent());
    }

    emit(TaskFormState.idle);
  }

  Future<void> editTask({
    required TaskDto task,
    required TaskStatus status,
    required String description,
    required int pomodoroSessions,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    emit(TaskFormState.loading);

    final res = await _api.apiTasksEditIdPut(
      id: task.id,
      body: TaskDto(
        id: task.id,
        description: description,
        pomodoroSessions: pomodoroSessions,
        taskStatus: status.backendEnumValue,
        startDay: startDate,
        deadlineDay: endDate,
      ),
    );

    if (res.isSuccessful) {
      send(TasksChangedMessage());
      emitPresentation(TaskFormSaveSuccessEvent());
    } else {
      emitPresentation(TaskFormSaveErrorEvent());
    }

    emit(TaskFormState.idle);
  }
}

enum TaskFormState { idle, loading }

sealed class TaskFormSaveEvent {}

class TaskFormSaveSuccessEvent extends TaskFormSaveEvent {}

class TaskFormSaveErrorEvent extends TaskFormSaveEvent {}

class TasksChangedMessage {}
