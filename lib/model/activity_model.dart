// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) =>
    ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  ActivityModel({
    this.result,
    this.errorMessage,
    this.data,
  });

  String result;
  String errorMessage;
  Data data;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        result: json["result"] == null ? null : json["result"],
        errorMessage:
            json["error_message"] == null ? null : json["error_message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "error_message": errorMessage == null ? null : errorMessage,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data(
      {this.activityTrxId,
      this.activityName,
      this.type,
      this.description,
      this.image,
      this.longitude,
      this.latitude,
      this.userId,
      this.inputDt,
      this.visitDuration,
      this.product,
      this.meetupWith,
      this.supplier});

  String activityTrxId;
  String activityName;
  String type;
  String description;
  String image;
  String longitude;
  String latitude;
  String userId;
  DateTime inputDt;
  String visitDuration;
  String product;
  String meetupWith;
  String supplier;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        activityTrxId:
            json["ActivityTrxId"] == null ? null : json["ActivityTrxId"],
        activityName:
            json["ActivityName"] == null ? null : json["ActivityName"],
        type: json["Type"] == null ? null : json["Type"],
        description: json["Description"] == null ? null : json["Description"],
        image: json["Image"] == null ? null : json["Image"],
        longitude: json["Longitude"] == null ? null : json["Longitude"],
        latitude: json["Latitude"] == null ? null : json["Latitude"],
        userId: json["UserId"] == null ? null : json["UserId"],
        inputDt:
            json["InputDt"] == null ? null : DateTime.parse(json["InputDt"]),
        visitDuration:
            json["VisitDuration"] == null ? null : json["VisitDuration"],
        product: json["Product"] == null ? null : json["Product"],
        meetupWith: json["MeetupWith"] == null ? null : json["MeetupWith"],
        supplier: json["Supplier"] == null ? null : json["Supplier"],
      );

  Map<String, dynamic> toJson() => {
        "ActivityTrxId": activityTrxId == null ? null : activityTrxId,
        "ActivityName": activityName == null ? null : activityName,
        "Type": type == null ? null : type,
        "Description": description == null ? null : description,
        "Image": image == null ? null : image,
        "Longitude": longitude == null ? null : longitude,
        "Latitude": latitude == null ? null : latitude,
        "UserId": userId == null ? null : userId,
        "InputDt": inputDt == null ? null : inputDt.toIso8601String(),
        "VisitDuration": visitDuration == null ? null : visitDuration,
        "Product": product == null ? null : product,
        "MeetupWith": meetupWith == null ? null : meetupWith,
        "Supplier": supplier == null ? null : supplier,
      };
}
