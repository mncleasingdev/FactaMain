// To parse this JSON data, do
//
//     final userdataModel = userdataModelFromJson(jsonString);

import 'dart:convert';

UserdataModel userdataModelFromJson(String str) =>
    UserdataModel.fromJson(json.decode(str));

String userdataModelToJson(UserdataModel data) => json.encode(data.toJson());

class UserdataModel {
  UserdataModel({
    this.result,
    this.errorMessage,
    this.data,
  });

  String result;
  String errorMessage;
  List<Datum> data;

  factory UserdataModel.fromJson(Map<String, dynamic> json) => UserdataModel(
        result: json["result"] == null ? null : json["result"],
        errorMessage:
            json["error_message"] == null ? null : json["error_message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "error_message": errorMessage == null ? null : errorMessage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum(
      {this.activityTrxId,
      this.activityName,
      this.type,
      this.description,
      this.image,
      this.longitude,
      this.latitude,
      this.visitDuration,
      this.userId,
      this.product,
      this.meetupWith,
      this.supplier,
      this.inputdt});

  String activityTrxId;
  String activityName;
  String type;
  String description;
  String image;
  String longitude;
  String latitude;
  String visitDuration;
  String userId;
  String product;
  String meetupWith;
  String supplier;
  String inputdt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        activityTrxId:
            json["ActivityTrxId"] == null ? null : json["ActivityTrxId"],
        activityName:
            json["ActivityName"] == null ? null : json["ActivityName"],
        type: json["Type"] == null ? null : json["Type"],
        description: json["Description"] == null ? null : json["Description"],
        image: json["Image"] == null ? null : json["Image"],
        longitude: json["Longitude"] == null ? null : json["Longitude"],
        latitude: json["Latitude"] == null ? null : json["Latitude"],
        visitDuration:
            json["VisitDuration"] == null ? null : json["VisitDuration"],
        userId: json["UserId"] == null ? null : json["UserId"],
        product: json["Product"] == null ? null : json["Product"],
        meetupWith: json["MeetupWith"] == null ? null : json["MeetupWith"],
        supplier: json["Supplier"] == null ? null : json["Supplier"],
        inputdt: json["InputDt"] == null ? null : json["InputDt"],
      );

  Map<String, dynamic> toJson() => {
        "ActivityTrxId": activityTrxId == null ? null : activityTrxId,
        "ActivityName": activityName == null ? null : activityName,
        "Type": type == null ? null : type,
        "Description": description == null ? null : description,
        "Image": image == null ? null : image,
        "Longitude": longitude == null ? null : longitude,
        "Latitude": latitude == null ? null : latitude,
        "VisitDuration": visitDuration == null ? null : visitDuration,
        "UserId": userId == null ? null : userId,
        "Product": product == null ? null : product,
        "MeetupWith": meetupWith == null ? null : meetupWith,
        "Supplier": supplier == null ? null : supplier,
        "InputDt": inputdt == null ? null : inputdt,
      };
}
