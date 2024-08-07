import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_AppName => 'ADHD Project';

  @override
  String get pomodoro_Timer_Title => 'Pomodoro Timer';

  @override
  String pomodoro_Timer_SessionOutOf(int session, int sessionsCount) {
    return '$session of $sessionsCount sessions';
  }

  @override
  String get pomodoro_Option_Pomodoro => 'Pomodoro';

  @override
  String get pomodoro_Option_ShortBreak => 'Short break';

  @override
  String get pomodoro_Option_LongBreak => 'Long break';

  @override
  String get backgroundNoise_Title => 'White noise';

  @override
  String get bottomNavBar_home => 'Home';

  @override
  String get bottomNavBar_tasks => 'Tasks';

  @override
  String get bottomNavBar_calendar => 'Calendar';

  @override
  String get bottomNavBar_profile => 'Profile';

  @override
  String get tasks_Title => 'Tasks';
}
