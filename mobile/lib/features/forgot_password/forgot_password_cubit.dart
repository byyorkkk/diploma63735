import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState>
    with BlocPresentationMixin<ForgotPasswordState, ForgotPasswordSendEvent> {
  ForgotPasswordCubit(this._api) : super(ForgotPasswordState.idle);

  final AdApi _api;

  Future<void> sendResetPasswordLink(String email) async {
    emit(ForgotPasswordState.sending);

    final res = await _api.apiAuthenticationForgotPasswordPost(
      email: email,
    );

    if (res.isSuccessful) {
      emitPresentation(ForgotPasswordSendSuccessEvent(email));
    } else {
      emitPresentation(ForgotPasswordSendErrorEvent());
    }

    emit(ForgotPasswordState.idle);
  }
}

enum ForgotPasswordState { idle, sending }

sealed class ForgotPasswordSendEvent {}

class ForgotPasswordSendSuccessEvent extends ForgotPasswordSendEvent {
  ForgotPasswordSendSuccessEvent(this.email);

  final String email;
}

class ForgotPasswordSendErrorEvent extends ForgotPasswordSendEvent {}
