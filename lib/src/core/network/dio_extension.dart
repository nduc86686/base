// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import '../exceptions/exceptions.dart';
//
//
// /// Helper methods for [DioError] error.
// extension DioErrorExtension on DioError {
//   /// Trả về true khi request cancelled.
//   bool get isCancelledError => type == DioErrorType.cancel;
//
//   /// Trả về true khi không thể kết nối mạng internet.
//   bool get isConnectionError {
//     return type == DioErrorType.other && error is SocketException;
//   }
//
//   /// Trả về true khi [FormatException] được trả về lúc parsing dữ liệu.
//   bool get isFormatError {
//     return type == DioErrorType.other && error is FormatException;
//   }
//
//   /// Trả về true khi status code nằm trong khoảng >= 400 và < 500.
//   bool get isResponseError => type == DioErrorType.response;
//
//   /// Trả về true khi request timeout lúc connecting, sending hoặc receiving.
//   bool get isTimeoutError {
//     return type == DioErrorType.connectTimeout ||
//         type == DioErrorType.sendTimeout ||
//         type == DioErrorType.receiveTimeout;
//   }
//
//   /// Trả về [NetworkException] khi [type] không phải là
//   /// [DioErrorType.response]. Còn không sẽ trả về [UnexpectedError].
//   ///
//   /// **Note:** Chỉ nên dùng khi data không trả về status code.
//   NetworkException<T> toNetWorkErrorOrThrow<T>() {
//     return toNetWorkError(onResponse: (res) => throw UnexpectedError(res));
//   }
//
//   /// Trả về [NetworkException] khi [type] không phải là
//   /// [DioErrorType.response]. Còn không sẽ trả về [onResponse].
//   NetworkException<T> toNetWorkError<T>({
//     required NetworkException<T> Function(Response response) onResponse,
//   }) {
//     switch (type) {
//       case DioErrorType.connectTimeout:
//       case DioErrorType.sendTimeout:
//       case DioErrorType.receiveTimeout:
//         return const NetworkException.timeout();
//       case DioErrorType.response:
//         final statusCode = response!.statusCode;
//         if (statusCode != null && statusCode >= 500) {
//           return const NetworkException.server();
//         } else {
//           return onResponse(response!);
//         }
//       case DioErrorType.cancel:
//         return const NetworkException.cancelled();
//       case DioErrorType.other:
//         if (isConnectionError) {
//           return const NetworkException.connection();
//         } else if (isFormatError) {
//           return const NetworkException.format();
//         } else {
//           return const NetworkException.server();
//         }
//     }
//   }
// }
