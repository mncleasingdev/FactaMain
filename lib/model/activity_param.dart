// To parse this JSON data, do
//
//     final activityParam = activityParamFromJson(jsonString);

import 'dart:convert';

ActivityParam activityParamFromJson(String str) =>
    ActivityParam.fromJson(json.decode(str));

String activityParamToJson(ActivityParam data) => json.encode(data.toJson());

class ActivityParam {
  ActivityParam(
      {this.activity,
      this.type,
      this.desc,
      this.image,
      this.longitude,
      this.latitude,
      this.username,
      this.visitDuration,
      this.product,
      this.meetupWith,
      this.supplier});

  String activity;
  String type;
  String desc;
  String image;
  String longitude;
  String latitude;
  String username;
  String visitDuration;
  String product;
  String meetupWith;
  String supplier;

  factory ActivityParam.fromJson(Map<String, dynamic> json) => ActivityParam(
        activity: json["activity"] == null ? null : json["activity"],
        type: json["type"] == null ? null : json["type"],
        desc: json["desc"] == null ? null : json["desc"],
        image: json["image"] == null ? null : json["image"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        username: json["username"] == null ? null : json["username"],
        visitDuration:
            json["visitDuration"] == null ? null : json["visitDuration"],
        product: json["product"] == null ? null : json["product"],
        meetupWith: json["meetupWith"] == null ? null : json["meetupWith"],
        supplier: json["Supplier"] == null ? null : json["Supplier"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity == null ? null : activity,
        "type": type == null ? null : type,
        "desc": desc == null ? null : desc,
        "image": image == null ? null : image,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
        "username": username == null ? null : username,
        "visitDuration": visitDuration == null ? null : visitDuration,
        "product": product == null ? null : product,
        "meetupWith": meetupWith == null ? null : meetupWith,
        "supplier": supplier == null ? null : supplier,
      };
}
