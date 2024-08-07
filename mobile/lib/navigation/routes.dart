import 'package:adhd_project/features/auth/presentation/auth_screen.dart';
import 'package:adhd_project/features/auth/presentation/welcome_screen.dart';
import 'package:adhd_project/features/background_noise/play_background_noise_screen.dart';
import 'package:adhd_project/features/forgot_password/forgot_password_screen.dart';
import 'package:adhd_project/features/home/home_screen.dart';
import 'package:adhd_project/features/journal/calendar_record_form/calendar_record_form_screen.dart';
import 'package:adhd_project/features/journal/journal_cubit.dart';
import 'package:adhd_project/features/pills/pill_form/pill_form_screen.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/pills/pills_list_screen.dart';
import 'package:adhd_project/features/pomodoro/pomodoro_screen.dart';
import 'package:adhd_project/features/reset_password/reset_password_screen.dart';
import 'package:adhd_project/features/settings/screens/pomodoro_settings_screen.dart';
import 'package:adhd_project/features/tasks/task_form/task_form_screen.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

const _homePageKey = ValueKey('HomePage');

@TypedGoRoute<HomeRoute<void>>(path: '/')
@immutable
class HomeRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      key: _homePageKey,
      child: const HomeScreen(),
    );
  }
}

@TypedGoRoute<PlayBackgroundNoiseRoute<void>>(path: '/background-noise')
@immutable
class PlayBackgroundNoiseRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const PlayBackgroundNoiseScreen(),
    );
  }
}

@TypedGoRoute<PomodoroRoute<void>>(path: '/pomodoro')
@immutable
class PomodoroRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const PomodoroScreen(),
    );
  }
}

@TypedGoRoute<CreateCalendarRecordRoute<void>>(
  path: '/create-calendar-record&:initialDateTimestamp',
)
@immutable
class CreateCalendarRecordRoute<T> extends GoRouteData {
  const CreateCalendarRecordRoute({required this.initialDateTimestamp});

  final int initialDateTimestamp;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: CalendarRecordFormScreen.create(
        initialDateTime: DateTime.fromMillisecondsSinceEpoch(
          initialDateTimestamp,
        ),
      ),
    );
  }
}

@TypedGoRoute<EditCalendarRecordRoute<void>>(
  path: '/edit-calendar-record/:calendarRecordId',
)
@immutable
class EditCalendarRecordRoute<T> extends GoRouteData {
  const EditCalendarRecordRoute({
    required this.calendarRecordId,
  });

  final int calendarRecordId;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    final calendarRecord = context
        .read<JournalCubit>()
        .state
        .mapOrNull(ready: (state) => state.sortedRecords)!
        .firstWhere((e) => e.id == calendarRecordId);

    return MaterialPage<T>(
      child: CalendarRecordFormScreen.edit(
        calendarRecord: calendarRecord,
      ),
    );
  }
}

@TypedGoRoute<CreateTaskRoute<void>>(path: '/create-task/:initialDateTimestamp')
@immutable
class CreateTaskRoute<T> extends GoRouteData {
  const CreateTaskRoute({
    required this.initialDateTimestamp,
  });

  final int initialDateTimestamp;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: TaskFormScreen.create(
        initialDateTime:
            DateTime.fromMillisecondsSinceEpoch(initialDateTimestamp),
      ),
    );
  }
}

@TypedGoRoute<EditTaskRoute<void>>(
  path: '/edit-task/:taskId',
)
@immutable
class EditTaskRoute<T> extends GoRouteData {
  const EditTaskRoute({
    required this.taskId,
  });

  final int taskId;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    final task = context
        .read<TasksCubit>()
        .state
        .mapOrNull(ready: (state) => state.allTasks)!
        .firstWhere((e) => e.id == taskId);

    return MaterialPage<T>(
      child: TaskFormScreen.edit(
        task: task,
      ),
    );
  }
}

@TypedGoRoute<CreatePillRoute<void>>(path: '/create-pill')
@immutable
class CreatePillRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const PillFormScreen(type: PillFormScreenType.create),
    );
  }
}

@TypedGoRoute<EditPillRoute<void>>(path: '/edit-pill/:pillId')
@immutable
class EditPillRoute<T> extends GoRouteData {
  const EditPillRoute({required this.pillId});

  final int pillId;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    final pill = context
        .read<PillsCubit>()
        .state
        .mapOrNull(ready: (state) => state.pills)!
        .firstWhere((e) => e.pillID == pillId);

    return MaterialPage<T>(
      child: PillFormScreen(
        pill: pill,
        type: PillFormScreenType.edit,
      ),
    );
  }
}

@TypedGoRoute<PillsRoute<void>>(path: '/pills')
@immutable
class PillsRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const PillsListScreen(),
    );
  }
}

@TypedGoRoute<WelcomeRoute<void>>(path: '/welcome')
@immutable
class WelcomeRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const WelcomeScreen(),
    );
  }
}

@TypedGoRoute<RegisterRoute<void>>(path: '/register')
@immutable
class RegisterRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const AuthScreen.register(key: ValueKey('Register')),
    );
  }
}

@TypedGoRoute<LogInRoute<void>>(path: '/log-in')
@immutable
class LogInRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const AuthScreen.logIn(key: ValueKey('LogIn')),
    );
  }
}

@TypedGoRoute<ForgotPasswordRoute<void>>(path: '/forgot-password')
@immutable
class ForgotPasswordRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const ForgotPasswordScreen(),
    );
  }
}

@TypedGoRoute<ResetPasswordRoute<void>>(path: '/reset-password/:email')
@immutable
class ResetPasswordRoute<T> extends GoRouteData {
  const ResetPasswordRoute({required this.email});

  final String email;

  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: ResetPasswordScreen(email: email),
    );
  }
}

@TypedGoRoute<PomodoroSettingsRoute<void>>(path: '/settings/pomodoro')
@immutable
class PomodoroSettingsRoute<T> extends GoRouteData {
  @override
  Page<T> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage<T>(
      child: const PomodoroSettingsScreen(),
    );
  }
}
