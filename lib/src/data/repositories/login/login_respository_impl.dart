import 'dart:io';

import 'package:dio/dio.dart';
import 'package:duck/src/core/params/login/login_with_user.dart';
import 'package:duck/src/core/resources/data_state.dart';
import 'package:duck/src/domain/entities/login/login.dart';
import 'package:duck/src/domain/repositories/login/login_responsitory.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/base_responsitory.dart';
import '../../../core/network/client.dart';
import '../../datasources/remote/login/login_api_service.dart';
@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginApiService? _loginApiService;

  LoginRepositoryImpl(this._loginApiService);

  @override
  Future<DataState<Login>> loginWithUserName(LoginParam params) async {
    _loginApiService = LoginApiService(Client.configDio());
    try {
      final httpResponse = await _loginApiService?.loginWithUserName(
          params.username!, params.password!, params.grantType!, params.clientId!);
      if (httpResponse?.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse!.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse?.response.statusMessage,
          response: httpResponse?.response,
          type: DioErrorType.response,
          requestOptions: RequestOptions(path: ''),
        ),
      );
    } on DioError catch (e) {
      BaseRepository.catchException(e);
      return DataFailed(e);
    }
  }
}
