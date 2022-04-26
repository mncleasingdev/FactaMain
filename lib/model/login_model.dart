// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.result,
    this.message,
    this.dataUser,
  });

  String result;
  String message;
  List<DataUser> dataUser;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        result: json["result"] == null ? null : json["result"],
        message: json["message"] == null ? null : json["message"],
        dataUser: json["dataUser"] == null
            ? null
            : List<DataUser>.from(
                json["dataUser"].map((x) => DataUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "message": message == null ? null : message,
        "dataUser": dataUser == null
            ? null
            : List<dynamic>.from(dataUser.map((x) => x.toJson())),
      };
}

class DataUser {
  DataUser({
    this.userId,
    this.userPassword,
    this.isActiveFlag,
    this.staffName,
  });

  String userId;
  String userPassword;
  int isActiveFlag;
  String staffName;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        userId: json["user_id"] == null ? null : json["user_id"],
        userPassword:
            json["user_password"] == null ? null : json["user_password"],
        isActiveFlag:
            json["is_active_flag"] == null ? null : json["is_active_flag"],
        staffName: json["staff_name"] == null ? null : json["staff_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "user_password": userPassword == null ? null : userPassword,
        "is_active_flag": isActiveFlag == null ? null : isActiveFlag,
        "staff_name": staffName == null ? null : staffName,
      };
}
