import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_credentials.g.dart';

@JsonSerializable()
@immutable
class TokenCredentials {
  const TokenCredentials({
    required this.accessToken,
    required this.accessTokenExp,
  });

  factory TokenCredentials.fromJson(Map<String, dynamic> json) =>
      _$TokenCredentialsFromJson(json);

  final String accessToken;
  final DateTime? accessTokenExp;

  Map<String, dynamic> toJson() => _$TokenCredentialsToJson(this);
}
