import 'dart:async';

import 'package:adhd_project/features/auth/service/credentials_manager/credentials_manager.dart';
import 'package:adhd_project/features/auth/token_credentials.dart';
import 'package:flutter/foundation.dart';

/// Abstracts out common sign in/out flows
class LoginManager {
  LoginManager({
    required CredentialsManager credentialsManager,
  }) : _credentialsManager = credentialsManager;

  final CredentialsManager _credentialsManager;

  @mustCallSuper
  Future<void> signOut() async {
    _credentialsManager.clearCredentials();
  }

  Future<TokenCredentials> signIn(
    SignInMethod method,
  ) async {
    final credentials = await method.execute();
    await _credentialsManager.saveCredentials(credentials);
    return credentials;
  }

  FutureOr<TokenCredentials?> getCredentials() =>
      _credentialsManager.getCredentials();

  FutureOr<bool> isSignedIn() async => (await getCredentials()) != null;

  Stream<bool>? _signInStatusChanged;
  Stream<bool> get signInStatusChanged =>
      _signInStatusChanged ??= _credentialsManager.credentialsChanged
          .map((credentials) => credentials != null)
          .asBroadcastStream();

  Future<void> dispose() {
    return _credentialsManager.dispose();
  }
}

abstract class SignOutHandler {
  Future<void> signOut();
}

abstract class SignInMethod {
  Future<TokenCredentials> execute();
}

class AuthorizationException implements Exception {}
