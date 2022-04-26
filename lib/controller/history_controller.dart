import 'package:activityapp/model/userdata_model.dart';
import 'package:activityapp/service/act_api.dart';
import 'package:activityapp/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController {
  String strUserID;
  String strStaffName;
  var viewList = new UserdataModel().data;

  @override
  void onInit() {
    getUserID();
    super.onInit();
  }

  getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String getUID = (prefs.getString('userID') ?? '');
    String getUserName = (prefs.getString('userName') ?? '');

    if (strUserID == '') {
      Get.off(() => LoginPage());
    } else {
      strUserID = getUID;
      strStaffName = getUserName;
      update();
      getViewData();
    }
  }

  getViewData() async {
    try {
      var dtUser = await getUserdata(strStaffName);
      viewList = dtUser.data;
      update();
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
