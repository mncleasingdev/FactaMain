import 'package:activityapp/model/login_param.dart';
import 'package:activityapp/service/login_api.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  String strStaffName;

  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  loginAPI(BuildContext context) async {
    try {
      var logParam = new LoginParam();
      logParam.token = "";
      logParam.userid = txtUserName.text;
      logParam.password = txtPassword.text;

      isLoading(true);
      var res = await callLoginAPI(logParam);
      isLoading(false);

      if (res.result == "1") {
        strStaffName = res.dataUser[0].staffName;
        await setUserID(txtUserName.text, strStaffName);
        Get.off(() => LandingPage());
      } else {
        var titleDialog = 'Info';
        var contentDialog = 'Username atau Password salah!';
        showDialogWidget(context, titleDialog, contentDialog);
      }
      update();

      return true;
    } catch (err) {
      var titleDialog = 'Info';
      var contentDialog = err.toString();
      isLoading(false);

      showDialogWidget(context, titleDialog, contentDialog);
      return false;
    }
  }

  setUserID(String userID, String userName) async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('userID', userID);
    await getLoginExist();
    isLoading(false);
  }

  showDialogWidget(BuildContext context, String strTitle, String strMsg) {
    Dialogs.materialDialog(
        msg: strMsg,
        title: strTitle,
        color: Colors.white,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'OK',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
