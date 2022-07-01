import 'package:dio/dio.dart';
import 'package:duck/src/core/network/service.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/constants.dart';
@injectable
class Client {
  static String _BASE_URL = kBaseUrl;
  static const int _CONNECT_TIMEOUT = 1000;
  static const int _RECEIVE_TIMEOUT = 10000;
  static const String _CONTENT_TYPE = 'application/json';
  static const String _CONTENT_TYPE_APP = 'x-www-form-urlencoded';
  static Dio? _dio;
  static Service? _service;

  static Service getClient() {
    return _service ??= Service(configDio());
  }

  static Dio configDio() {
    _dio ??= Dio(BaseOptions(
        baseUrl: _BASE_URL,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        headers: {},
        contentType: _CONTENT_TYPE_APP))
      ..interceptors.add(PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true));
    return _dio!;
  }

  void setUrl(String url) {
    if (url != null) {
      _BASE_URL = url;
    }
  }

  static void _logPrint(v) {
    // showDioLog(v);
  }
}
