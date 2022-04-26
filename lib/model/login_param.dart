// To parse this JSON data, do
//
//     final loginParam = loginParamFromJson(jsonString);

import 'dart:convert';

LoginParam loginParamFromJson(String str) =>
    LoginParam.fromJson(json.decode(str));

String loginParamToJson(LoginParam data) => json.encode(data.toJson());

class LoginParam {
  LoginParam({
    this.token,
    this.userid,
    this.password,
  });

  String token;
  String userid;
  String password;

  factory LoginParam.fromJson(Map<String, dynamic> json) => LoginParam(
        token: json["token"] == null ? null : json["token"],
        userid: json["userid"] == null ? null : json["userid"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "userid": userid == null ? null : userid,
        "password": password == null ? null : password,
      };
}
