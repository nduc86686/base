import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duck/src/core/params/login/login_with_user.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecaes/login/login_usecase.dart';
import '../../../models/formz_models/email.dart';
import '../../../models/formz_models/password.dart';
import 'login_screen_state.dart';

@injectable
class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(
      this._loginUseCase
    // this._accountCubit,
    // this._authRepository,
    // this._repository,
  ) : super(const LoginScreenState());

  // final IKeyCloakApiService _repository;
  // final AccountCubit _accountCubit;
  // final IAuthRepository _authRepository;
  final LoginUseCase _loginUseCase;
  Future initScreen(String? email) async {
    if (email?.isNotEmpty ?? false) {
      await getToParams(email!);
    } else {
      // await getToLocalStorage();
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getToParams(String email) async {
    emailChange(email);
    emit(state.copyWith(initUsername: email));
  }

  // Future<void> getToLocalStorage() async {
  //   final _userName = await _authRepository.getUserName();
  //   final _password = await _authRepository.getPassword();
  //
  //   if ((_userName?.isNotEmpty ?? false)) {
  //     emailChange(_userName!);
  //     passwordChange(_password!);
  //     emit(state.copyWith(
  //       initUsername: _userName,
  //       initPassword: _password,
  //     ));
  //   }
  // }

  void emailChange(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
      error: '',
    ));
  }

  void passwordChange(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
      error: '',
    ));
  }

  void rememberLoginChange(bool value) =>
      emit(state.copyWith(rememberLogin: value));

  void loginSubmit() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final auth = await _loginUseCase.call(
          params: LoginParam(username: state.email.value,
            password: state.password.value,clientId: 'mobile',grantType: 'password')
        );
        // await _accountCubit.login(
        //   auth: auth,
        //   username: state.email.value,
        //   password: state.password.value,
        // );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on DioError catch (e) {
        errorMessage(e);
      }
    }
  }

  void errorMessage(DioError error) {
    String? errorMessenger;
    switch (error.response?.data['error']) {
      case 'invalid_grant':
        errorMessenger = 'Lỗi';
        break;
      default:
        errorMessenger = null;
        break;
    }
    emit(state.copyWith(
      status: FormzStatus.submissionFailure,
      error: errorMessenger,
    ));
  }
}
