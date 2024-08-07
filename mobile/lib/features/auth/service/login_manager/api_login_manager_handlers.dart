import 'dart:convert';

import 'package:adhd_project/data/api/generated/ad_api.swagger.dart';
import 'package:adhd_project/features/auth/service/login_manager/login_manager.dart';
import 'package:adhd_project/features/auth/token_credentials.dart';

class ADApiConfirm2FASignInMethod implements SignInMethod {
  ADApiConfirm2FASignInMethod({
    required AdApi api,
    required this.email,
    required this.code,
  }) : _api = api;

  final AdApi _api;
  final String email;
  final String code;

  @override
  Future<TokenCredentials> execute() async {
    final response = await _api.apiAuthenticationLogIn2FAPost(
      body: LoginOTPModel(
        email: email,
        code: code,
      ),
    );

    if (response.isSuccessful) {
      final data = (jsonDecode(response.bodyString)
          as Map<String, dynamic>)['response'] as Map<String, dynamic>;

      return TokenCredentials(
        accessToken: data['token'] as String,
        accessTokenExp: DateTime.tryParse(data['expiryTokenDate'] as String),
      );
    }

    throw AuthorizationException();
  }
}
