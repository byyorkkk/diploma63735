import 'dart:async';

import 'package:adhd_project/common/util/wait.dart';
import 'package:adhd_project/features/pomodoro/model/pomodoro_options.dart';
import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:vibration/vibration.dart';

part 'pomodoro_timer_cubit.freezed.dart';

class PomodoroTimerCubit extends Cubit<PomodoroTimerState> {
  PomodoroTimerCubit(this._settingsCubit)
      : super(
          PomodoroTimerState.idle(
            pickedOption: (
              option: PomodoroOption.pomodoro,
              duration: PomodoroOption.pomodoro.getDuration(
                _settingsCubit.state,
              )
            ),
          ),
        ) {
    // Subscription to change default pomodoro session length in case settings changed
    _settingsSub = _settingsCubit.stream.listen((settingsState) {
      if (state.pickedOption.option == PomodoroOption.pomodoro) {
        emit(
          state.copyWith(
            pickedOption: _getOptionWithDuration(PomodoroOption.pomodoro),
          ),
        );
      }
    });
  }

  // TODO: Refactor to remove dependency on settings cubit
  final SettingsCubit _settingsCubit;
  StreamSubscription<SettingsState>? _settingsSub;

  PomodoroOptionWithDuration _getOptionWithDuration(
    PomodoroOption option,
  ) =>
      (option: option, duration: option.getDuration(_settingsCubit.state));

  StopWatchTimer? _timer;

  Future<void> start() async {
    final state = this.state;
    if (state is PomodoroTimerRunning && !state.finished) {
      throw StateError('Pomodoro is already running and not finished');
    }

    await _runTimer(state.pickedOption, state.pickedOption.duration);
  }

  Future<void> pause() async {
    final state = this.state;
    if (state is! PomodoroTimerRunning) {
      throw StateError('Pomodoro timer has to be running in order to pause it');
    }

    _timer!.onStopTimer();

    emit(
      PomodoroTimerState.running(
        pickedOption: state.pickedOption,
        timeLeft: state.timeLeft,
        status: PomodoroTimerRunningStatus.paused,
      ),
    );
  }

  Future<void> resume() async {
    final state = this.state;
    if (state is! PomodoroTimerRunning || !state.paused) {
      throw StateError('Pomodoro timer has to be paused in order to resume it');
    }

    await _runTimer(state.pickedOption, state.timeLeft);
  }

  Future<void> stop() async {
    final state = this.state;
    if (state is! PomodoroTimerRunning) {
      throw StateError('Pomodoro timer has to be running in order to stop it');
    }

    _timer!.onStartTimer();

    emit(
      PomodoroTimerState.running(
        pickedOption: state.pickedOption,
        timeLeft: state.timeLeft,
        status: PomodoroTimerRunningStatus.finished,
      ),
    );
  }

  Future<void> reset() async {
    final state = this.state;
    if (state is! PomodoroTimerRunning || !(state.finished || state.paused)) {
      throw StateError(
        'Pomodoro timer has to be paused or finished in order to reset it.',
      );
    }

    await _timer!.dispose();

    emit(PomodoroTimerState.idle(pickedOption: state.pickedOption));
  }

  void changePomodoroOption(PomodoroOption option) {
    final state = this.state;
    if (state is PomodoroTimerRunning && !state.finished) {
      throw StateError('Pomodoro option can be changed only for idle timer');
    }

    emit(PomodoroTimerState.idle(pickedOption: _getOptionWithDuration(option)));
  }

  Future<void> _runTimer(
    PomodoroOptionWithDuration pickedOption,
    Duration remainingTime,
  ) async {
    emit(
      PomodoroTimerState.running(
        pickedOption: pickedOption,
        timeLeft: remainingTime,
      ),
    );

    _timer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: remainingTime.inMilliseconds,
      onChange: (millis) {
        final state = this.state;
        if (state is! PomodoroTimerRunning) {
          throw StateError(
            'Pomodoro timer was running in PomodoroTimerIdle state',
          );
        }

        final timeLeft = Duration(milliseconds: millis);
        if (timeLeft < const Duration(milliseconds: 100)) {
          unawaited(_notifySessionFinished());

          emit(
            state.copyWith(
              status: PomodoroTimerRunningStatus.finished,
              timeLeft: Duration.zero,
            ),
          );
        } else {
          emit(state.copyWith(timeLeft: timeLeft));
        }
      },
    );

    _timer?.onStartTimer();
  }

  @override
  void onChange(Change<PomodoroTimerState> change) {
    final nextState = change.nextState;
    if (nextState is PomodoroTimerRunning && nextState.finished) {
      _timer?.onStopTimer();
    }

    super.onChange(change);
  }

  @override
  Future<void> close() async {
    await _settingsSub?.cancel();
    await _timer?.dispose();
    await super.close();
  }

  Future<void> _notifySessionFinished() {
    final settings = _settingsCubit.state;

    return Future.wait([
      // TODO: Fix playing sound for web
      if (!settings.pomodoroSilentMode && !kIsWeb)
        () async {
          await FlutterRingtonePlayer.play(
            // TODO: Configurable through settings ringtone
            fromAsset: 'assets/alarms/attention.mp3',
            looping: false,
          );
          await wait(milliseconds: 3000);
          await FlutterRingtonePlayer.stop();
        }(),
      if (settings.pomodoroVibrationEnabled)
        Vibration.vibrate(duration: 3000, amplitude: 255),
    ]);
  }
}

enum PomodoroTimerRunningStatus { running, paused, finished }

typedef PomodoroOptionWithDuration = ({
  PomodoroOption option,
  Duration duration
});

@freezed
class PomodoroTimerState with _$PomodoroTimerState {
  const factory PomodoroTimerState.idle({
    required PomodoroOptionWithDuration pickedOption,
  }) = PomodoroTimerIdle;
  const factory PomodoroTimerState.running({
    required PomodoroOptionWithDuration pickedOption,
    required Duration timeLeft,
    @Default(PomodoroTimerRunningStatus.running)
    PomodoroTimerRunningStatus status,
  }) = PomodoroTimerRunning;
}

extension XPomodoroTimerRunning on PomodoroTimerRunning {
  bool get running => status == PomodoroTimerRunningStatus.running;
  bool get paused => status == PomodoroTimerRunningStatus.paused;
  bool get finished => status == PomodoroTimerRunningStatus.finished;
}
