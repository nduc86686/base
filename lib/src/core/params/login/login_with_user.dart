
class LoginParam {
  LoginParam({
    this.username,
    this.password,
    this.grantType,
    this.clientId,});

  LoginParam.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
    grantType = json['grant_type'];
    clientId = json['client_id'];
  }
  String? username;
  String? password;
  String? grantType;
  String? clientId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    map['grant_type'] = grantType;
    map['client_id'] = clientId;
    return map;
  }

}