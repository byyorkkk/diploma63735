import 'dart:async';

import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_timer_cubit.dart';
import 'package:adhd_project/features/pomodoro/model/pomodoro_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'pomodoro_session_cubit.freezed.dart';

class PomodoroSessionCubit extends Cubit<PomodoroSessionState> {
  PomodoroSessionCubit(this._timerCubit)
      : super(
          const PomodoroSessionState(currentRound: 1, roundsCount: 6),
        ) {
    _timerCubitSub = _timerCubit.stream
        .whereType<PomodoroTimerRunning>()
        .where((timerState) => timerState.finished)
        .listen((timerState) {
      if (timerState.pickedOption.option == PomodoroOption.pomodoro) {
        emit(state.copyWith(awaitsPickingBreakLengthOption: true));
        return;
      }

      _timerCubit.changePomodoroOption(PomodoroOption.pomodoro);

      if (state.currentRound == state.roundsCount) {
        reset();
      } else {
        emit(
          state.copyWith(
            currentRound: state.currentRound + 1,
            awaitsPickingBreakLengthOption: false,
          ),
        );
      }
    });
  }

  final PomodoroTimerCubit _timerCubit;

  late StreamSubscription<PomodoroTimerState> _timerCubitSub;

  void startSession(TaskDto? task, int roundsCount) {
    emit(
      PomodoroSessionState(
        task: task,
        currentRound: 1,
        roundsCount: roundsCount,
      ),
    );
  }

  void reset() {
    emit(
      PomodoroSessionState(
        currentRound: 1,
        roundsCount: state.roundsCount,
        task: state.task,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _timerCubitSub.cancel();
    await super.close();
  }
}

@freezed
class PomodoroSessionState with _$PomodoroSessionState {
  const factory PomodoroSessionState({
    TaskDto? task,
    required int roundsCount,

    /// Number of current round in range from 1 to [roundsCount] inclusive
    required int currentRound,
    @Default(false) bool awaitsPickingBreakLengthOption,
  }) = _PomodoroSessionState;
}
