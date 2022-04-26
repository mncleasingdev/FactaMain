import 'dart:convert';

import 'package:activityapp/model/activity_model.dart';
import 'package:activityapp/model/activity_param.dart';
import 'package:activityapp/model/supplierdata_model.dart';
import 'package:activityapp/model/userdata_model.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:http/http.dart' as http;

Future<ActivityModel> callActivity(ActivityParam jsonParam) async {
  Uri myUri = Uri.parse(urlAPI + "addActivity");

  var param = json.encode(jsonParam.toJson());

  final response = await http.post(myUri,
      headers: {"Content-Type": "application/json"}, body: param);

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return ActivityModel.fromJson(res);
  } else {
    throw Exception(response.body);
  }
}

Future<List<String>> getDropdownType() async {
  List<String> listoftype;
  Uri myUri = Uri.parse(urlAPI + "GetActivityType");
  final response = await http.get(myUri);
  if (response.statusCode == 201) {
    listoftype = (jsonDecode(response.body) as List<dynamic>).cast<String>();
  }

  return listoftype;
}

Future<List<String>> getDropdownProduct() async {
  List<String> listofproduct;
  Uri myUri = Uri.parse(urlAPI + "GetActivityProduct");
  final response = await http.get(myUri);
  if (response.statusCode == 201) {
    listofproduct = (jsonDecode(response.body) as List<dynamic>).cast<String>();
  }

  return listofproduct;
}

Future<UserdataModel> getUserdata(String userName) async {
  Uri myUri = Uri.parse(urlAPI + "listactivity");

  final response = await http.post(myUri, body: {"username": userName});

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return UserdataModel.fromJson(res);
  } else {
    throw Exception('ga dapet data');
  }
}

Future<UserdataModel> getUserdataBydID(String trxID) async {
  Uri myUri = Uri.parse(urlAPI + "GetActivityByID");

  final response = await http.post(myUri, body: {"trxID": trxID});

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return UserdataModel.fromJson(res);
  } else {
    throw Exception('ga dapet data');
  }
}

Future<String> updateActivity(
    String trxID, String activityName, String desc) async {
  Uri myUri = Uri.parse(urlAPI + "UpdateActivity");

  final response = await http.post(myUri, body: {
    "trxID": trxID,
    "ActivityName": activityName,
    "Description": desc
  });

  if (response.statusCode == 201) {
    // var res = json.decode(response.body);
    return "1";
  } else {
    throw Exception('update error');
  }
}

Future<List<SupplierDataModel>> getSupplierdata(String value) async {
  Uri myUri = Uri.parse(urlAPI + "GetMasterSupplier");

  final response = await http.post(myUri, body: {"search": value});

  if (response.statusCode == 201) {
    var jsonObject = json.decode(response.body);
    List<dynamic> listSupp = (jsonObject as Map<String, dynamic>)["data"];

    List<SupplierDataModel> supp = [];
    for (int i = 0; i < listSupp.length; i++) {
      supp.add(SupplierDataModel.createSupp(listSupp[i]));
    }

    return supp;
  } else {
    throw Exception('ga dapet data');
  }
}

Future<List<String>> getDropdownSupplier() async {
  List<String> listofsupplier;
  Uri myUri = Uri.parse(urlAPI + "GetSupplierList");
  final response = await http.get(myUri);
  if (response.statusCode == 201) {
    listofsupplier =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
  }

  return listofsupplier;
}

Future<List<String>> getDropdownSupplierByProduct(String value) async {
  List<String> listofsupplier;
  Uri myUri = Uri.parse(urlAPI + "GetSupplierByProduct");
  final response = await http.post(myUri, body: {"product": value});
  if (response.statusCode == 201) {
    listofsupplier =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
  }

  return listofsupplier;
}
