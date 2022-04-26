import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController extends GetxController {
  @override
  void onInit() {
    isValidLogin();
    super.onInit();
  }

  logoutAction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', '');
    await prefs.setString('userName', '');
    Get.off(() => LoginPage());
    Get.reset();
  }

  isValidLogin() async {
    getLoginExist();
    if (prefUserName == '') {
      Get.off(() => LoginPage());
      Get.reset();
    }
  }
}
