import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Login extends Equatable {
  final String? accessToken;
  final int? expiresIn;
  final int? refreshExpiresIn;
  final String? refreshToken;
  final String? tokenType;
  final int? notbeforepolicy;
  final String? sessionState;
  final String? scope;

  const Login({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.notbeforepolicy,
    required this.sessionState,
    required this.scope,
  });

  @override
  List<Object> get props {
    return [
      accessToken!,
      expiresIn!,
      refreshExpiresIn!,
      refreshToken!,
      tokenType!,
      notbeforepolicy!,
      sessionState!,
      scope!,
    ];
  }

  @override
  bool get stringify => true;
}
