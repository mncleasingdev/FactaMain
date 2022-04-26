import 'package:activityapp/model/userdata_model.dart';
import 'package:activityapp/service/act_api.dart';
import 'package:activityapp/view/listdata_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  // String trxID;
  var viewList = new UserdataModel().data;

  TextEditingController txtActivity = TextEditingController();
  TextEditingController txtDesc = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  getViewData(String trxID) async {
    try {
      var dtUser = await getUserdataBydID(trxID);
      viewList = dtUser.data;

      if (viewList != null) {
        txtActivity.text = viewList[0].activityName;
        txtDesc.text = viewList[0].description;
      }

      update();
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  postActivity(String trxID) async {
    try {
      await updateActivity(trxID, txtActivity.text, txtDesc.text);
      Get.off(() => ListDataPage());
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
