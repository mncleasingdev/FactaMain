// To parse this JSON data, do
//
//     final supplierModel = supplierModelFromJson(jsonString);

import 'dart:convert';

SupplierModel supplierModelFromJson(String str) =>
    SupplierModel.fromJson(json.decode(str));

String supplierModelToJson(SupplierModel data) => json.encode(data.toJson());

class SupplierModel {
  SupplierModel({
    this.result,
    this.errorMessage,
    this.data,
  });

  String result;
  String errorMessage;
  List<Datum> data;

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
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
  Datum({
    this.masterSupplierId,
    this.supplierName,
    this.supplierAddr,
    this.supplierCp,
    this.supplierCpPhone,
    this.supplierCp2,
    this.supplierCpPhone2,
    this.isActive,
  });

  String masterSupplierId;
  String supplierName;
  String supplierAddr;
  String supplierCp;
  String supplierCpPhone;
  String supplierCp2;
  String supplierCpPhone2;
  String isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        masterSupplierId: json["master_supplier_id"] == null
            ? null
            : json["master_supplier_id"],
        supplierName:
            json["supplier_name"] == null ? null : json["supplier_name"],
        supplierAddr:
            json["supplier_addr"] == null ? null : json["supplier_addr"],
        supplierCp: json["supplier_cp"] == null ? null : json["supplier_cp"],
        supplierCpPhone: json["supplier_cp_phone"] == null
            ? null
            : json["supplier_cp_phone"],
        supplierCp2:
            json["supplier_cp_2"] == null ? null : json["supplier_cp_2"],
        supplierCpPhone2: json["supplier_cp_phone_2"] == null
            ? null
            : json["supplier_cp_phone_2"],
        isActive: json["is_active"] == null ? null : json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "master_supplier_id":
            masterSupplierId == null ? null : masterSupplierId,
        "supplier_name": supplierName == null ? null : supplierName,
        "supplier_addr": supplierAddr == null ? null : supplierAddr,
        "supplier_cp": supplierCp == null ? null : supplierCp,
        "supplier_cp_phone": supplierCpPhone == null ? null : supplierCpPhone,
        "supplier_cp_2": supplierCp2 == null ? null : supplierCp2,
        "supplier_cp_phone_2":
            supplierCpPhone2 == null ? null : supplierCpPhone2,
        "is_active": isActive == null ? null : isActive,
      };
}
