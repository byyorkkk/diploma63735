import 'package:adhd_project/features/settings/models/pomodoro_alarm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._sharedPreferences)
      : super(_getSettings(_sharedPreferences));

  static const String _pomodoroAlarmKey = 'Pomodoro/Alarm';
  static const String _pomodoroVibrationEnabledKey =
      'Pomodoro/VibrationEnabled';
  static const String _pomodoroSilentModeKey = 'Pomodoro/SilentMode';
  static const String _pomodoroRoundDurationKey = 'Pomodoro/RoundDuration';
  static const String _pomodoroShortBreakDurationKey =
      'Pomodoro/ShortBreakDuration';
  static const String _pomodoroLongBreakDurationKey =
      'Pomodoro/LongBreakDuration';

  final SharedPreferences _sharedPreferences;

  static PomodoroAlarm _getPomodoroAlarm(SharedPreferences sharedPreferences) {
    final value = sharedPreferences.getInt(_pomodoroAlarmKey);
    return value == null ? PomodoroAlarm.kitchen : PomodoroAlarm.fromId(value);
  }

  static bool _getPomodoroVibrationEnabled(
    SharedPreferences sharedPreferences,
  ) =>
      sharedPreferences.getBool(_pomodoroVibrationEnabledKey) ?? true;

  static bool _getPomodoroSilentMode(SharedPreferences sharedPreferences) =>
      sharedPreferences.getBool(_pomodoroSilentModeKey) ?? false;

  static Duration _getPomodoroRoundDuration(
    SharedPreferences sharedPreferences,
  ) {
    final value = sharedPreferences.getInt(_pomodoroRoundDurationKey);
    return value == null
        ? const Duration(minutes: 25)
        : Duration(minutes: value);
  }

  static Duration _getPomodoroShortBreakDuration(
    SharedPreferences sharedPreferences,
  ) {
    final value = sharedPreferences.getInt(_pomodoroShortBreakDurationKey);
    return value == null
        ? const Duration(minutes: 5)
        : Duration(minutes: value);
  }

  static Duration _getPomodoroLongBreakDuration(
    SharedPreferences sharedPreferences,
  ) {
    final value = sharedPreferences.getInt(_pomodoroLongBreakDurationKey);
    return value == null
        ? const Duration(minutes: 15)
        : Duration(minutes: value);
  }

  static SettingsState _getSettings(SharedPreferences sharedPreferences) {
    return SettingsState(
      pomodoroAlarm: _getPomodoroAlarm(sharedPreferences),
      pomodoroVibrationEnabled: _getPomodoroVibrationEnabled(
        sharedPreferences,
      ),
      pomodoroSilentMode: _getPomodoroSilentMode(sharedPreferences),
      pomodoroRoundDuration: _getPomodoroRoundDuration(
        sharedPreferences,
      ),
      pomodoroShortBreakDuration: _getPomodoroShortBreakDuration(
        sharedPreferences,
      ),
      pomodoroLongBreakDuration: _getPomodoroLongBreakDuration(
        sharedPreferences,
      ),
    );
  }

  Future<void> setPomodoroAlarm(PomodoroAlarm value) async {
    await _sharedPreferences.setInt(_pomodoroAlarmKey, value.id);
    emit(state.copyWith(pomodoroAlarm: value));
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setPomodoroVibrationEnabled(bool value) async {
    await _sharedPreferences.setBool(_pomodoroVibrationEnabledKey, value);
    emit(state.copyWith(pomodoroVibrationEnabled: value));
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setPomodoroSilentMode(bool value) async {
    await _sharedPreferences.setBool(_pomodoroSilentModeKey, value);
    emit(state.copyWith(pomodoroSilentMode: value));
  }

  Future<void> setPomodoroRoundDuration(Duration value) async {
    await _sharedPreferences.setInt(_pomodoroRoundDurationKey, value.inMinutes);
    emit(state.copyWith(pomodoroRoundDuration: value));
  }

  Future<void> setPomodoroShortBreakDuration(Duration value) async {
    await _sharedPreferences.setInt(
      _pomodoroShortBreakDurationKey,
      value.inMinutes,
    );
    emit(state.copyWith(pomodoroShortBreakDuration: value));
  }

  Future<void> setPomodoroLongBreakDuration(Duration value) async {
    await _sharedPreferences.setInt(
      _pomodoroLongBreakDurationKey,
      value.inMinutes,
    );
    emit(state.copyWith(pomodoroLongBreakDuration: value));
  }
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required PomodoroAlarm pomodoroAlarm,
    required bool pomodoroVibrationEnabled,
    required bool pomodoroSilentMode,
    required Duration pomodoroRoundDuration,
    required Duration pomodoroShortBreakDuration,
    required Duration pomodoroLongBreakDuration,
  }) = _SettingsState;
}
