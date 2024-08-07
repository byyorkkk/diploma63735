import 'dart:async';

import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/auth/service/login_manager/api_login_manager_handlers.dart';
import 'package:adhd_project/features/auth/service/login_manager/login_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LoginManager loginManager,
    required AdApi api,
  })  : _loginManager = loginManager,
        _api = api,
        super(const AuthState.unauthenticated());

  final LoginManager _loginManager;
  final AdApi _api;

  final _logger = Logger('AuthCubit');

  StreamSubscription<bool>? _subscription;

  Future<void> initialize() async {
    if (await _loginManager.isSignedIn()) {
      _logger.info('Login client is logged in. Emitted AuthAuthenticated.');
      emit(const AuthState.authenticated());
    } else {
      _logger.info('Login client not logged in. Emitted AuthUnauthenticated.');
      emit(const AuthState.unauthenticated());
    }

    await _subscription?.cancel();

    // log out whenever credentials are cleared
    _subscription = _loginManager.signInStatusChanged
        .where((isSignedIn) => !isSignedIn)
        .listen((_) {
      if (state is AuthAuthenticated) {
        signOut();
      }
    });
  }

  Future<void> signOut() async {
    await _loginManager.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    if (state is AuthAuthenticated) {
      return;
    }
    emit(const AuthState.unauthenticated(busy: true));

    try {
      final response = await _api.apiAuthenticationLogInPost(
        body: LoginModel(
          email: email,
          password: password,
        ),
      );

      if (response.isSuccessful) {
        emit(const AuthState.unauthenticated(required2FAConfirmation: true));

        return;
      }

      emit(
        const AuthState.unauthenticated(error: AuthErrorReason.unexpectedError),
      );
    } catch (e, st) {
      _handleException(e, st);
    }
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    if (state is AuthAuthenticated) {
      return;
    }
    emit(const AuthState.unauthenticated(busy: true));

    try {
      final result = await _api.apiAuthenticationPost(
        body: RegisterUser(
          username: username,
          email: email,
          password: password,
        ),
      );

      if (result.isSuccessful) {
        emit(
          const AuthState.unauthenticated(
            requiresEmailConfirmation: true,
          ),
        );
        return;
      }

      emit(
        const AuthState.unauthenticated(error: AuthErrorReason.unexpectedError),
      );
    } catch (e, st) {
      _handleException(e, st);
    }
  }

  Future<void> confirmFACode({
    required String email,
    required String code,
  }) async {
    if (state is AuthAuthenticated) {
      return;
    }

    emit(
      const AuthState.unauthenticated(
        busy: true,
        required2FAConfirmation: true,
      ),
    );

    try {
      final signInMethod = ADApiConfirm2FASignInMethod(
        api: _api,
        email: email,
        code: code,
      );

      await _loginManager.signIn(signInMethod);

      emit(const AuthState.authenticated());
    } catch (e, st) {
      _handleException(e, st);
    }
  }

  void _handleException(Object err, StackTrace st) {
    _logger.info('LoginClient failed to log in', err, st);

    var error = AuthErrorReason.unexpectedError;

    if (err is AuthorizationException) {
      error = AuthErrorReason.invalidCredentials;
    }

    emit(
      AuthState.unauthenticated(
        required2FAConfirmation: state.required2FAConfirmation,
        requiresEmailConfirmation: state.requiresEmailConfirmation,
        error: error,
      ),
    );
  }

  Future<String?> getAccessTokenAsync() async {
    final credentials = await _loginManager.getCredentials();

    return credentials?.accessToken;
  }

  @override
  void onChange(Change<AuthState> change) {
    _logger.info(
      'Auth state changed from ${change.currentState} to ${change.nextState}',
    );

    if (change.nextState is AuthAuthenticated) {
      _logger.info('Logged in');
    }

    super.onChange(change);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}

enum AuthErrorReason {
  emailNotConfirmed,
  invalidCredentials,
  invalid2FACode,
  unexpectedError,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated({
    @Default(false) bool busy,
    @Default(false) bool requiresEmailConfirmation,
    @Default(false) bool required2FAConfirmation,
    AuthErrorReason? error,
  }) = AuthUnauthenticated;

  const factory AuthState.authenticated() = AuthAuthenticated;

  const AuthState._();

  bool get busy => maybeMap(
        unauthenticated: (state) => state.busy,
        orElse: () => false,
      );

  bool get requiresEmailConfirmation => maybeMap(
        unauthenticated: (state) => state.requiresEmailConfirmation,
        orElse: () => false,
      );

  bool get required2FAConfirmation => maybeMap(
        unauthenticated: (state) => state.required2FAConfirmation,
        orElse: () => false,
      );

  AuthErrorReason? get error => mapOrNull(
        unauthenticated: (state) => state.error,
      );
}
