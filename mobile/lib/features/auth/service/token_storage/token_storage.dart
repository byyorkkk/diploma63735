import 'dart:async';

import 'package:adhd_project/features/auth/token_credentials.dart';

abstract class TokenStorage {
  FutureOr<TokenCredentials?> read();
  FutureOr<void> write(TokenCredentials? credentials);
  FutureOr<void> clear();
}
