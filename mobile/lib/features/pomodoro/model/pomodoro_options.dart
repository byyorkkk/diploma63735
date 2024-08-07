import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:adhd_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum PomodoroOption {
  pomodoro(
    color: Color(0xFFFF575C),
  ),
  shortBreak(
    color: Color(0xFF1AB65C),
  ),
  longBreak(
    color: Color(0xFF246BFD),
  );

  const PomodoroOption({
    required this.color,
  });

  final Color color;

  Duration getDuration(SettingsState state) {
    return switch (this) {
      pomodoro => state.pomodoroRoundDuration,
      longBreak => state.pomodoroLongBreakDuration,
      shortBreak => state.pomodoroShortBreakDuration,
    };
  }

  String tr(AppLocalizations s) => switch (this) {
        pomodoro => s.pomodoro_Option_Pomodoro,
        shortBreak => s.pomodoro_Option_ShortBreak,
        longBreak => s.pomodoro_Option_LongBreak,
      };
}
