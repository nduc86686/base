import 'package:duck/src/domain/entities/login/login.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Login {
  LoginModel(
      {required String? accessToken,
      required int? expiresIn,
      required int? refreshExpiresIn,
      required String? refreshToken,
      required String? tokenType,
      required int? notbeforepolicy,
      required String? sessionState,
      required String? scope})
      : super(
            accessToken: accessToken,
            expiresIn: expiresIn,
            refreshExpiresIn: refreshExpiresIn,
            refreshToken: refreshToken,
            tokenType: tokenType,
            notbeforepolicy: notbeforepolicy,
            sessionState: sessionState,
            scope: scope);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
