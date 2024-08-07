import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState>
    with BlocPresentationMixin<ResetPasswordState, ResetPasswordSendEvent> {
  ResetPasswordCubit(this._api) : super(ResetPasswordState.idle);

  final AdApi _api;

  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    emit(ResetPasswordState.loading);

    final res = await _api.apiAuthenticationResetPasswordPost(
      body: ResetPassword(
        password: password,
        confirmPassword: confirmPassword,
        email: email,
        token: code,
      ),
    );

    if (res.isSuccessful) {
      emitPresentation(ResetPasswordSendSuccessEvent());
    } else {
      emitPresentation(ResetPasswordSendErrorEvent());
    }

    emit(ResetPasswordState.idle);
  }
}

enum ResetPasswordState { idle, loading }

sealed class ResetPasswordSendEvent {}

class ResetPasswordSendSuccessEvent extends ResetPasswordSendEvent {}

class ResetPasswordSendErrorEvent extends ResetPasswordSendEvent {}
