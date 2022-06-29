class BaseResponse {
  int? statusCode;
  dynamic data;

  BaseResponse({
    this.statusCode,
    this.data,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    statusCode = json['statusCode'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['statusCode'] = statusCode;
    return data;
  }
}

// class Error {
//   int? code;
//   String? message;
//
//   Error({this.code, this.message});
//
//   Error.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['code'] = code;
//     data['message'] = message;
//     return data;
//   }
// }
