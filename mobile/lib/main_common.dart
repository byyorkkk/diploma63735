import 'package:adhd_project/app.dart';
import 'package:adhd_project/config/app_config.dart';
import 'package:adhd_project/di/global_providers.dart';
import 'package:adhd_project/features/audio/init_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set locale for `Intl`
  Intl.defaultLocale = await findSystemLocale();

  _setupLogger(config);

  final audioHandler = await initAudioService();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    GlobalProviders(
      audioHandler: audioHandler,
      config: config,
      sharedPreferences: sharedPreferences,
      child: const MyApp(),
    ),
  );
}

void _setupLogger(AppConfig config) {
  final flutterErrorLogger = Logger('FlutterError');
  FlutterError.onError = (details) {
    if (config.debugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      flutterErrorLogger.warning(
        details.summary.name,
        details.exception,
        details.stack,
      );
    }
  };
}
