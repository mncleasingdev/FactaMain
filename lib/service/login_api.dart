import 'dart:convert';
import 'package:activityapp/utils/environment.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:activityapp/model/login_model.dart';
import 'package:activityapp/model/login_param.dart';

Future<LoginModel> callLoginAPI(LoginParam jsonParam) async {
  Uri myUri = Uri.parse(urlAPI + "login");
  String dtNow = DateTime.now().day.toString();
  String secretkey = keyAPI + dtNow.padLeft(2, '0');
  var secretbytes = utf8.encode(secretkey);
  var tokenAPI = sha256.convert(secretbytes);

  jsonParam.token = tokenAPI.toString();

  var param = json.encode(jsonParam.toJson());

  var response = await http.post(myUri,
      headers: {"Content-Type": "application/json"}, body: param);

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return LoginModel.fromJson(res);
  } else {
    throw Exception('ga dapet data');
  }
}
