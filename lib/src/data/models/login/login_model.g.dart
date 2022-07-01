// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      accessToken: json['accessToken'] as String?,
      expiresIn: json['expiresIn'] as int?,
      refreshExpiresIn: json['refreshExpiresIn'] as int?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
      notbeforepolicy: json['notbeforepolicy'] as int?,
      sessionState: json['sessionState'] as String?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshExpiresIn': instance.refreshExpiresIn,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'notbeforepolicy': instance.notbeforepolicy,
      'sessionState': instance.sessionState,
      'scope': instance.scope,
    };
