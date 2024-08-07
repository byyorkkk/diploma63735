import 'dart:async';

import 'package:adhd_project/features/auth/service/credentials_manager/credentials_manager.dart';
import 'package:http/http.dart';

/// This HTTP client handles adding access tokens to requests and refreshing
/// them if they are expired.
class AuthHttpClient extends BaseClient {
  AuthHttpClient({
    required CredentialsManager credentialsManager,
    Client? client,
  })  : _credentialsManager = credentialsManager,
        _client = client ?? Client();

  final CredentialsManager _credentialsManager;
  final Client _client;

  FutureOr<bool> shouldWrapRequest(BaseRequest request) => true;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (request.headers['Authorization'] != null) {
      return _client.send(request);
    }

    final headerAdded = await _addAuthorizationHeader(request);

    final response = await _client.send(request);

    if (!headerAdded) {
      return response;
    }

    if (response.statusCode == 401) {
      final requestCopy = _copyRequest(request);
      await _credentialsManager.clearCredentials();
      final headerAdded = await _addAuthorizationHeader(requestCopy);
      if (headerAdded) {
        return _client.send(requestCopy);
      }
    }

    return response;
  }

  Future<bool> _addAuthorizationHeader(BaseRequest request) async {
    final credentials = await _credentialsManager.getCredentials();

    if (credentials != null) {
      request.headers['Authorization'] = 'Bearer ${credentials.accessToken}';
      request.headers['accept'] = '*/*';
      request.headers['Content-Type'] = 'application/json';
      return true;
    }
    return false;
  }

  BaseRequest _copyRequest(BaseRequest request) {
    BaseRequest requestCopy;

    if (request is Request) {
      requestCopy = Request(request.method, request.url)
        ..encoding = request.encoding
        ..bodyBytes = request.bodyBytes;
    } else if (request is MultipartRequest) {
      requestCopy = MultipartRequest(request.method, request.url)
        ..fields.addAll(request.fields)
        ..files.addAll(request.files);
    } else if (request is StreamedRequest) {
      throw Exception('copying streamed requests is not supported');
    } else {
      throw Exception('request type is unknown, cannot copy');
    }

    requestCopy
      ..persistentConnection = request.persistentConnection
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..headers.addAll(request.headers);

    return requestCopy;
  }

  @override
  void close() {
    _client.close();
    super.close();
  }
}
