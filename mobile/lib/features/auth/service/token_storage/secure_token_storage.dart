import 'dart:async';
import 'dart:convert';

import 'package:adhd_project/features/auth/service/token_storage/token_storage.dart';
import 'package:adhd_project/features/auth/token_credentials.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage({FlutterSecureStorage? storage, String? storageKey})
      : _storage = storage ?? const FlutterSecureStorage(),
        _storageKey = storageKey ?? defaultStorageKey;

  final FlutterSecureStorage _storage;
  final String _storageKey;

  static const defaultStorageKey = 'token';

  @override
  FutureOr<void> clear() async {
    await _storage.delete(key: _storageKey);
  }

  @override
  FutureOr<TokenCredentials?> read() async {
    final value = await _storage.read(key: _storageKey);
    if (value == null) {
      return null;
    }
    try {
      return TokenCredentials.fromJson(
        json.decode(value) as Map<String, dynamic>,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  FutureOr<void> write(TokenCredentials? credentials) async {
    await _storage.write(
      key: _storageKey,
      value: json.encode(credentials),
    );
  }
}
