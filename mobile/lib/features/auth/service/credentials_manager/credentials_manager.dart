import 'dart:async';

import 'package:adhd_project/features/auth/service/token_storage/token_storage.dart';
import 'package:adhd_project/features/auth/token_credentials.dart';

abstract class CredentialsRefresher {
  Future<TokenCredentials?> refresh(String refreshToken);
}

class CredentialsManager {
  CredentialsManager(this._tokenStorage);

  final TokenStorage _tokenStorage;

  final _credentialsChangedStreamController =
      StreamController<TokenCredentials?>.broadcast();

  Stream<TokenCredentials?> get credentialsChanged =>
      _credentialsChangedStreamController.stream;

  FutureOr<TokenCredentials?> getCredentials() {
    return _tokenStorage.read();
  }

  FutureOr<void> saveCredentials(TokenCredentials? credentials) async {
    await _tokenStorage.write(credentials);
    _credentialsChangedStreamController.add(credentials);
  }

  FutureOr<void> clearCredentials() async {
    await saveCredentials(null);
  }

  Future<void> dispose() {
    return _credentialsChangedStreamController.close();
  }
}
