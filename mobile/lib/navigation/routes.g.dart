// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $playBackgroundNoiseRoute,
      $pomodoroRoute,
      $createCalendarRecordRoute,
      $editCalendarRecordRoute,
      $createTaskRoute,
      $editTaskRoute,
      $createPillRoute,
      $editPillRoute,
      $pillsRoute,
      $welcomeRoute,
      $registerRoute,
      $logInRoute,
      $forgotPasswordRoute,
      $resetPasswordRoute,
      $pomodoroSettingsRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $playBackgroundNoiseRoute => GoRouteData.$route(
      path: '/background-noise',
      factory: $PlayBackgroundNoiseRouteExtension._fromState,
    );

extension $PlayBackgroundNoiseRouteExtension on PlayBackgroundNoiseRoute {
  static PlayBackgroundNoiseRoute _fromState(GoRouterState state) =>
      PlayBackgroundNoiseRoute();

  String get location => GoRouteData.$location(
        '/background-noise',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $pomodoroRoute => GoRouteData.$route(
      path: '/pomodoro',
      factory: $PomodoroRouteExtension._fromState,
    );

extension $PomodoroRouteExtension on PomodoroRoute {
  static PomodoroRoute _fromState(GoRouterState state) => PomodoroRoute();

  String get location => GoRouteData.$location(
        '/pomodoro',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $createCalendarRecordRoute => GoRouteData.$route(
      path: '/create-calendar-record&:initialDateTimestamp',
      factory: $CreateCalendarRecordRouteExtension._fromState,
    );

extension $CreateCalendarRecordRouteExtension on CreateCalendarRecordRoute {
  static CreateCalendarRecordRoute _fromState(GoRouterState state) =>
      CreateCalendarRecordRoute(
        initialDateTimestamp:
            int.parse(state.pathParameters['initialDateTimestamp']!),
      );

  String get location => GoRouteData.$location(
        '/create-calendar-record&${Uri.encodeComponent(initialDateTimestamp.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $editCalendarRecordRoute => GoRouteData.$route(
      path: '/edit-calendar-record/:calendarRecordId',
      factory: $EditCalendarRecordRouteExtension._fromState,
    );

extension $EditCalendarRecordRouteExtension on EditCalendarRecordRoute {
  static EditCalendarRecordRoute _fromState(GoRouterState state) =>
      EditCalendarRecordRoute(
        calendarRecordId: int.parse(state.pathParameters['calendarRecordId']!),
      );

  String get location => GoRouteData.$location(
        '/edit-calendar-record/${Uri.encodeComponent(calendarRecordId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $createTaskRoute => GoRouteData.$route(
      path: '/create-task/:initialDateTimestamp',
      factory: $CreateTaskRouteExtension._fromState,
    );

extension $CreateTaskRouteExtension on CreateTaskRoute {
  static CreateTaskRoute _fromState(GoRouterState state) => CreateTaskRoute(
        initialDateTimestamp:
            int.parse(state.pathParameters['initialDateTimestamp']!),
      );

  String get location => GoRouteData.$location(
        '/create-task/${Uri.encodeComponent(initialDateTimestamp.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $editTaskRoute => GoRouteData.$route(
      path: '/edit-task/:taskId',
      factory: $EditTaskRouteExtension._fromState,
    );

extension $EditTaskRouteExtension on EditTaskRoute {
  static EditTaskRoute _fromState(GoRouterState state) => EditTaskRoute(
        taskId: int.parse(state.pathParameters['taskId']!),
      );

  String get location => GoRouteData.$location(
        '/edit-task/${Uri.encodeComponent(taskId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $createPillRoute => GoRouteData.$route(
      path: '/create-pill',
      factory: $CreatePillRouteExtension._fromState,
    );

extension $CreatePillRouteExtension on CreatePillRoute {
  static CreatePillRoute _fromState(GoRouterState state) => CreatePillRoute();

  String get location => GoRouteData.$location(
        '/create-pill',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $editPillRoute => GoRouteData.$route(
      path: '/edit-pill/:pillId',
      factory: $EditPillRouteExtension._fromState,
    );

extension $EditPillRouteExtension on EditPillRoute {
  static EditPillRoute _fromState(GoRouterState state) => EditPillRoute(
        pillId: int.parse(state.pathParameters['pillId']!),
      );

  String get location => GoRouteData.$location(
        '/edit-pill/${Uri.encodeComponent(pillId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $pillsRoute => GoRouteData.$route(
      path: '/pills',
      factory: $PillsRouteExtension._fromState,
    );

extension $PillsRouteExtension on PillsRoute {
  static PillsRoute _fromState(GoRouterState state) => PillsRoute();

  String get location => GoRouteData.$location(
        '/pills',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $welcomeRoute => GoRouteData.$route(
      path: '/welcome',
      factory: $WelcomeRouteExtension._fromState,
    );

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => WelcomeRoute();

  String get location => GoRouteData.$location(
        '/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register',
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $logInRoute => GoRouteData.$route(
      path: '/log-in',
      factory: $LogInRouteExtension._fromState,
    );

extension $LogInRouteExtension on LogInRoute {
  static LogInRoute _fromState(GoRouterState state) => LogInRoute();

  String get location => GoRouteData.$location(
        '/log-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
      path: '/forgot-password',
      factory: $ForgotPasswordRouteExtension._fromState,
    );

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      ForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $resetPasswordRoute => GoRouteData.$route(
      path: '/reset-password/:email',
      factory: $ResetPasswordRouteExtension._fromState,
    );

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(
        email: state.pathParameters['email']!,
      );

  String get location => GoRouteData.$location(
        '/reset-password/${Uri.encodeComponent(email)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $pomodoroSettingsRoute => GoRouteData.$route(
      path: '/settings/pomodoro',
      factory: $PomodoroSettingsRouteExtension._fromState,
    );

extension $PomodoroSettingsRouteExtension on PomodoroSettingsRoute {
  static PomodoroSettingsRoute _fromState(GoRouterState state) =>
      PomodoroSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/pomodoro',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
