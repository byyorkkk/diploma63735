import 'package:adhd_project/common/util/date_utils.dart';
import 'package:adhd_project/common/util/decode_api_query.dart';
import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/tasks/task_form/task_form_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart' as comms;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState>
    with comms.Listener<TasksChangedMessage> {
  TasksCubit(this._api) : super(const TasksState.initial()) {
    listen();
  }

  final AdApi _api;

  static final _logger = Logger('TasksCubit');

  Future<void> fetch() async {
    final selectedDayOrNull = state.mapOrNull(
      ready: (state) => state.selectedDay,
    );

    emit(const TasksState.loading());

    try {
      final res = await _api.apiTasksGet();

      if (res.isSuccessful) {
        final body = decodeApiQuery(res.bodyString);

        if (body.isEmpty) {
          emit(
            TasksState.ready(
              allTasks: [],
              selectedDay: selectedDayOrNull ?? DateTime.now(),
            ),
          );
          return;
        }

        final tasks = body.map(TaskDto.fromJson).toList();

        emit(
          TasksState.ready(
            allTasks: tasks,
            selectedDay: selectedDayOrNull ?? DateTime.now(),
          ),
        );
      }
    } catch (err, st) {
      _logger.shout('Could not fetch tasks', err, st);
      emit(const TasksState.error());
    }
  }

  void pickDay(DateTime day) {
    final state = this.state;
    if (state is! TasksReady) {
      throw StateError(
        'Could not change selected day for not loaded tasks state',
      );
    }

    emit(state.copyWith(selectedDay: day));
  }

  @override
  void onMessage(TasksChangedMessage message) {
    fetch();
  }
}

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksInitial;
  const factory TasksState.loading() = TasksLoading;
  const factory TasksState.ready({
    required Iterable<TaskDto> allTasks,
    required DateTime selectedDay,
  }) = TasksReady;
  const factory TasksState.error() = TasksError;

  const TasksState._();
}

extension XTasksReady on TasksReady {
  Iterable<TaskDto> get selectedDayTasks => allTasks.where((e) {
        final startDate = e.startDay!.date;
        final endDate = e.deadlineDay!.date;

        return selectedDay.sameDateAs(startDate) ||
            selectedDay.sameDateAs(endDate) ||
            (selectedDay.isAfter(startDate) && selectedDay.isBefore(endDate));
      });
}
