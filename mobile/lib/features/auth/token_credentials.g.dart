// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenCredentials _$TokenCredentialsFromJson(Map<String, dynamic> json) =>
    TokenCredentials(
      accessToken: json['AccessToken'] as String,
      accessTokenExp: json['AccessTokenExp'] == null
          ? null
          : DateTime.parse(json['AccessTokenExp'] as String),
    );

Map<String, dynamic> _$TokenCredentialsToJson(TokenCredentials instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'AccessTokenExp': instance.accessTokenExp?.toIso8601String(),
    };
