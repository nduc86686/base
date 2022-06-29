import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../main.dart';
import '../utils/constant.dart';
import 'base_response.dart';

class BaseRepository {
  static catchException(Object exception) {
    // setStatus(Status.error);
    // showError(exception.toString());
    if (exception is FormatException) {
      return _formatException(exception);
    } else if (exception is DioError) {
      if (exception.response?.statusCode == HttpStatus.unauthorized) {
        return _refreshToken(exception);
      } else if (exception.response?.statusCode == HttpStatus.forbidden) {
        return _forbiddenException(exception);
      } else if (exception.response?.statusCode == HttpStatus.notFound) {
        return _notFoundException(exception);
      } else if (exception.response?.statusCode == HttpStatus.badGateway) {
        return _badRequestException(exception);
      } else if (exception.type == DioErrorType.connectTimeout) {
        return _timeOutException(exception);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        return _receiveTimeOutException(exception);
      } else {
        return _otherException(exception);
      }
    }
  }

  static _refreshToken(DioError exception) {
    setMessage(Constant.tokenExpired);
  }

  static _forbiddenException(DioError exception) {
    setMessage(Constant.forbidden);
  }

  static _notFoundException(DioError exception) {
    setMessage(Constant.notFound);
  }

  static _badRequestException(DioError exception) {
    setMessage(Constant.unknown);
  }

  static _timeOutException(DioError exception) {
    setMessage(Constant.connectTimeOut);
  }

  static _receiveTimeOutException(DioError exception) {
    setMessage(Constant.retrieveTimeOut);
  }

  static _notConnectException(SocketException exception) {
    setMessage(Constant.notConnectError);
    // setStatus(Status.noConnection);
  }

  static _formatException(FormatException exception) {}

  static _otherException(DioError exception) {
    if (exception.error is SocketException) {
      ///
      _notConnectException(exception.error);
      return;
    }
    setMessage(Constant.unknown);
    return;
  }

  // void setStatus(Status s) {
  //   final controller = Get.find<T>();
  //   controller.setStatus(Status.error);
  // }

  static setMessage(String s) {
    Alert(context: navigatorKey.currentContext!, title: "RFLUTTER", desc: "$s")
        .show();
    // final controller = Get.find<T>();
    // controller.setMessage(s ?? Constant.unknown);
    var logger = Logger();

    logger.e("Error $s");
  }

  bool catchServerError(BaseResponse baseResponse) {
    if (baseResponse != null && baseResponse.statusCode != 0) {
      // setStatus(Status.error);
      // setMessage(baseResponse.error?.message);
      return false;
    }
    return true;
  }
}
