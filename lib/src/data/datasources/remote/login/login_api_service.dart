import 'package:dio/dio.dart';
import 'package:duck/src/data/models/login/login_model.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../domain/entities/login/login.dart';
part 'login_api_service.g.dart';
@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @GET('/top-headlines')
  Future<HttpResponse<LoginModel>> loginWithUserName(
    @Query("username") String username,
    @Query("password") String password,
    @Query("grant_type") String grant_type,
    @Query("client_id") String client_id,
  );
}
