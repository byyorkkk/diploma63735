import 'package:adhd_project/config/app_config.dart';
import 'package:adhd_project/data/api/generated/client_index.dart';
import 'package:adhd_project/features/audio/audio_player_handler.dart';
import 'package:adhd_project/features/auth/auth_http_client.dart';
import 'package:adhd_project/features/auth/presentation/auth_cubit.dart';
import 'package:adhd_project/features/auth/service/credentials_manager/credentials_manager.dart';
import 'package:adhd_project/features/auth/service/login_manager/login_manager.dart';
import 'package:adhd_project/features/auth/service/token_storage/secure_token_storage.dart';
import 'package:adhd_project/features/auth/service/token_storage/token_storage.dart';
import 'package:adhd_project/features/background_noise/play_background_noise_cubit.dart';
import 'package:adhd_project/features/home/home_navigation_cubit.dart';
import 'package:adhd_project/features/journal/journal_cubit.dart';
import 'package:adhd_project/features/pills/pills_cubit.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_session_cubit.dart';
import 'package:adhd_project/features/pomodoro/bloc/pomodoro_timer_cubit.dart';
import 'package:adhd_project/features/settings/settings_cubit.dart';
import 'package:adhd_project/features/tasks/tasks_cubit.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
    required this.config,
    required this.audioHandler,
    required this.sharedPreferences,
  });

  final Widget child;
  final AppConfig config;
  final ADAudioHandler audioHandler;
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: config),
        Provider.value(value: audioHandler),
        Provider.value(value: sharedPreferences),
        Provider<TokenStorage>(
          create: (context) => SecureTokenStorage(
            storage: const FlutterSecureStorage(),
            storageKey: 'auth',
          ),
        ),
        Provider(
          create: (context) => CredentialsManager(context.read()),
        ),
        Provider<http.Client>(
          create: (context) => AuthHttpClient(
            credentialsManager: context.read(),
          ),
        ),
        Provider(
          create: (context) => AdApi.create(
            client: ChopperClient(
              baseUrl: config.apiUri,
              converter: const JsonConverter(),
              interceptors: <dynamic>[
                if (config.debugMode) HttpLoggingInterceptor(),
              ],
              client: context.read(),
            ),
          ),
        ),
        Provider(
          create: (context) => LoginManager(
            credentialsManager: context.read(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              loginManager: context.read(),
              api: context.read(),
            )..initialize(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => PlayBackgroundNoiseCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => JournalCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => PillsCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => TasksCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => HomeNavigationCubit(),
          ),
          BlocProvider(
            create: (context) => PomodoroTimerCubit(context.read()),
          ),
          BlocProvider(
            create: (context) => PomodoroSessionCubit(context.read()),
          ),
        ],
        child: child,
      ),
    );
  }
}
