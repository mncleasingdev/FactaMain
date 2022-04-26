import 'package:activityapp/model/supplierdata_model.dart';
import 'package:activityapp/service/act_api.dart';
import 'package:activityapp/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupplierController extends GetxController {
  var isLoading = false.obs;

  String strUserID;
  String strStaffName;
  // List<SupplierDataModel> viewList;
  var viewList = <SupplierDataModel>[].obs;
  TextEditingController txtSearch = TextEditingController();

  @override
  void onInit() {
    getUserID();
    getTableSupplier('');
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
    }
  }

  getTableSupplier(String value) async {
    isLoading(true);
    try {
      var dtSupp = await getSupplierdata(value);
      viewList.value = dtSupp;
    } catch (err) {}
    isLoading(false);
  }
}
