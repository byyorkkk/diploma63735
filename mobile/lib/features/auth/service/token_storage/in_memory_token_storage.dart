import 'dart:async';

import 'package:adhd_project/features/auth/service/token_storage/token_storage.dart';
import 'package:adhd_project/features/auth/token_credentials.dart';

class InMemoryTokenStorage implements TokenStorage {
  InMemoryTokenStorage({TokenCredentials? initialCredentials})
      : _credentials = initialCredentials;

  TokenCredentials? _credentials;

  @override
  FutureOr<void> clear() {
    _credentials = null;
  }

  @override
  FutureOr<TokenCredentials?> read() async {
    return _credentials;
  }

  @override
  FutureOr<void> write(TokenCredentials? credentials) async {
    _credentials = credentials;
  }
}
