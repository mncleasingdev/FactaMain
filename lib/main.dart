import 'package:activityapp/controller/edit_controller.dart';
import 'package:activityapp/controller/input_controller.dart';
import 'package:activityapp/controller/landing_controller.dart';
import 'package:activityapp/controller/login_controller.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/landing_page.dart';
import 'package:activityapp/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  Get.put(LandingController());
  Get.put(InputController());
  Get.put(EditController());

  getLocPermition();
  await getLoginExist();

  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Activity',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF1E3163, color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (prefUserName ?? '') != '' ? LandingPage() : LoginPage(),
    );
  }
}

Future getLocPermition() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  try {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  } catch (err) {
    debugPrint(err.toString());
  }
}
