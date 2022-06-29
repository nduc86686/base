// import 'package:flutter/foundation.dart';
//
// import 'app_exception.dart';
//
// /// Generic network exception.
//
// @immutable
// abstract class NetworkException<T>
//     with _HelperMixin<T>
//     implements AppException {
//   /// Dùng khi gửi 1 request lên máy chủ và được trả về 1 lỗi.
//   /// Ví dụ như lỗi 404 (Not Found).
//   ///
//   /// Đọc thêm ở đây để biết thêm chi tiết
//   /// https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_client_errors
//   const factory NetworkException.api(T error) = _ApiException<T>;
//
//   /// Dùng khi request bị huỷ.
//   const factory NetworkException.cancelled() = _RequestCancelledException<T>;
//
//   /// Dùng khi không thể kết nối internet
//   const factory NetworkException.connection() = _InternetConnectionException<T>;
//
//   /// Dùng khi thrown trả về [FormatException] hoặc [TypeError] .
//   const factory NetworkException.format() = _NetworkFormatException<T>;
//
//   /// Dùng khi server bị lỗi (status code > 500)
//   const factory NetworkException.server() = _ServerException<T>;
//
//   /// Dùng khi mở, send, or receive dữ liệu từ server bị timeout
//   const factory NetworkException.timeout() = _NetworkTimeoutException<T>;
//
//   const NetworkException._();
//
//   @override
//   String toString() {
//     if (this is _ApiException<T>) {
//       final error = (this as _ApiException<T>).error;
//       return '$runtimeType($error)';
//     }
//     return '$runtimeType()';
//   }
// }
//
// class _ApiException<T> extends NetworkException<T> {
//   const _ApiException(this.error) : super._();
//
//   final T error;
//
//   @override
//   int get hashCode => error.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is _ApiException<T> &&
//           runtimeType == other.runtimeType &&
//           error == other.error;
// }
//
// /// [NetworkException] helper mixin methods and getters.
// mixin _HelperMixin<T> {
//   /// Trả về true nếu lỗi là [NetworkException.api].
//   bool get isApiError => this is _ApiException<T>;
//
//   /// Trả về true nếu lỗi là [NetworkException.cancelled].
//   bool get isCancellationError => this is _RequestCancelledException<T>;
//
//   /// Trả về true nếu lỗi là [NetworkException.connection].
//   bool get isConnectionError => this is _InternetConnectionException<T>;
//
//   /// Trả về true nếu lỗi là [NetworkException.format].
//   bool get isFormatException => this is _NetworkFormatException<T>;
//
//   /// Trả về true nếu lỗi là [NetworkException.server].
//   bool get isServerError => this is _ServerException<T>;
//
//   /// Trả về true nếu lỗi là [NetworkException.timeout].
//   bool get isTimeoutError => this is _NetworkTimeoutException<T>;
//
//   /// Trả về tên lỗi
//   String get name {
//     if (isApiError) return 'api';
//     if (isCancellationError) return 'cancelled';
//     if (isConnectionError) return 'connection';
//     if (isFormatException) return 'format';
//     if (isServerError) return 'server';
//     if (isTimeoutError) return 'timeout';
//     throw FallThroughError();
//   }
// }
//
// class _InternetConnectionException<T> extends NetworkException<T> {
//   const _InternetConnectionException() : super._();
// }
//
// class _NetworkFormatException<T> extends NetworkException<T> {
//   const _NetworkFormatException() : super._();
// }
//
// class _NetworkTimeoutException<T> extends NetworkException<T> {
//   const _NetworkTimeoutException() : super._();
// }
//
// class _RequestCancelledException<T> extends NetworkException<T> {
//   const _RequestCancelledException() : super._();
// }
//
// class _ServerException<T> extends NetworkException<T> {
//   const _ServerException() : super._();
// }
