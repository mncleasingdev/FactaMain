import 'package:activityapp/controller/landing_controller.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/listdata_page.dart';
import 'package:activityapp/view/supplier_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'input_page.dart';

class LandingPage extends StatelessWidget {
  final landCon = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    double widthMenuSize = (MediaQuery.of(context).size.width / 3) - 30;
    return Scaffold(
        body: Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 10,
                    color: Color(0xFF1E3163),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/icologo.jpg',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    radius: 60,
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: TextDirection.rtl,
                                start: 0,
                                top: 10,
                                child: MaterialButton(
                                  onPressed: () {
                                    landCon.logoutAction();
                                  },
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: Icon(
                                    Icons.logout,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  shape: CircleBorder(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                            child: Text(
                              "Hi, " + prefUserName ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                            elevation: 10,
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Get.to(() => InputPage());
                                },
                                child: SizedBox(
                                  width: widthMenuSize,
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        const IconData(
                                          61843,
                                          fontFamily: 'MaterialIcons',
                                        ),
                                        size: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        child: Text('Input Activity'),
                                      ),
                                    ],
                                  ),
                                ))),
                        Card(
                            elevation: 10,
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Get.to(() => ListDataPage());
                                },
                                child: SizedBox(
                                  width: widthMenuSize,
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        const IconData(57691,
                                            fontFamily: 'MaterialIcons'),
                                        size: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        child: Text('View Activity'),
                                      ),
                                    ],
                                  ),
                                ))),
                        Card(
                            elevation: 10,
                            child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Get.to(() => SupplierPage());
                                },
                                child: SizedBox(
                                  width: widthMenuSize,
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        const IconData(58513,
                                            fontFamily: 'MaterialIcons'),
                                        size: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        child: Text('List Supplier'),
                                      ),
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
