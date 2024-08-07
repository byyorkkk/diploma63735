import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:adhd_project/l10n/app_localizations.dart';
import 'package:adhd_project/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:timetable/timetable.dart';

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useMemoized(() => createGoRouter(context));

    return Portal(
      child: MaterialApp.router(
        theme: ADTheme.light(),
        routerConfig: router,
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          TimetableLocalizationsDelegate(),
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
