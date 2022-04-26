import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final urlAPI =
    "https://approval.mncleasing.com/activity.api/index.php/api/activity/";
final keyAPI =
    "TJb0oVKxOiJSeRdbLklADCQxHGkLscr9Jr0WcyjOGQwIxyK7IVxanbxUHHuYHJXf0N10b8FGOZealO7UxsULtftZKLNilAlbec0d8vJMiMKuoFcMXWlf1C4BeHHp7So9";
final formKey = GlobalKey<FormState>();

String prefUserID;
String prefUserName;

Future getLoginExist() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefUserID = (prefs.getString('userID') ?? '');
  prefUserName = (prefs.getString('userName') ?? '');
}
