import 'dart:async';

import 'package:adhd_project/features/auth/presentation/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'redirections.dart';
import 'routes.dart';

class _AuthRefresher extends ValueNotifier<bool> {
  _AuthRefresher(AuthCubit cubit) : super(false) {
    _authSub = cubit.stream.listen((authState) {
      value = authState is AuthAuthenticated;
    });
  }

  late final StreamSubscription<AuthState> _authSub;

  @override
  Future<void> dispose() async {
    await _authSub.cancel();
    super.dispose();
  }
}

GoRouter createGoRouter(
  BuildContext context, {
  String? initialLocation,
}) {
  return GoRouter(
    initialLocation: initialLocation ?? WelcomeRoute<void>().location,
    routes: $appRoutes,
    refreshListenable: _AuthRefresher(context.read()),
    redirect: (context, state) => getRedirection(
      context,
      state.uri,
    ),
  );
}
