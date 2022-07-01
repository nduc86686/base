import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../models/formz_models/email.dart';
import '../../../models/formz_models/password.dart';

class LoginScreenState extends Equatable {
  const LoginScreenState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.rememberLogin = false,
    this.initPassword,
    this.initUsername,
    this.isLoading = true,
    this.error = '',
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final bool rememberLogin;
  final String? initUsername;
  final String? initPassword;
  final bool isLoading;
  final String error;

  LoginScreenState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    bool? rememberLogin,
    String? initUsername,
    String? initPassword,
    bool? isLoading,
    String? error,
  }) {
    return LoginScreenState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      rememberLogin: rememberLogin ?? this.rememberLogin,
      initUsername: initUsername ?? this.initUsername,
      initPassword: initPassword ?? this.initPassword,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        rememberLogin,
        initUsername,
        initPassword,
        isLoading,
        error,
      ];
}
