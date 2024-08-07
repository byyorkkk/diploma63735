import 'package:adhd_project/features/auth/presentation/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

typedef Redirection = String? Function(
  BuildContext context,
  String location, {
  Map<String, String>? queryParams,
});

String? getRedirection(
  BuildContext context,
  Uri uri,
) {
  final isAuthenticated = context.read<AuthCubit>().state is AuthAuthenticated;
  final onAPublicPage = {
    LogInRoute<void>().location,
    RegisterRoute<void>().location,
    WelcomeRoute<void>().location,
    ForgotPasswordRoute<void>().location,
    const ResetPasswordRoute<void>(email: '').location,
  }.contains(uri.toString());

  // Not signed in user on private page -> redirect root
  if (!isAuthenticated && !onAPublicPage) {
    return WelcomeRoute<void>().location;
  }

  // Authorized user on a public page -> redirect home
  if (isAuthenticated && onAPublicPage) {
    return HomeRoute<void>().location;
  }

  return null;
}
