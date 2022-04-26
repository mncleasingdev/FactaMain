import 'package:activityapp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  final loginCon = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        builder: (controller) => Scaffold(
              body: controller.isLoading.value == false
                  ? SingleChildScrollView(
                      child: Listener(
                        onPointerDown: (_) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.focusedChild?.unfocus();
                          }
                        },
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height,
                              maxWidth: MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.blue[800], Colors.blue[600]],
                                begin: Alignment.topLeft,
                                end: Alignment.centerRight),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 36.0, horizontal: 24.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Facta 2.0",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 46.0,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "PT MNC Guna Usaha Indonesia",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          controller: controller.txtUserName,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide.none),
                                              filled: true,
                                              fillColor: Color(0xFFe7edeb),
                                              hintText: "User ID",
                                              prefixIcon: Icon(
                                                Icons.account_circle,
                                                color: Colors.grey[600],
                                              )),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: controller.txtPassword,
                                          obscureText: true,
                                          onFieldSubmitted: (value) async {
                                            await controller.loginAPI(context);
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide.none),
                                              filled: true,
                                              fillColor: Color(0xFFe7edeb),
                                              hintText: "Password",
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Colors.grey[600],
                                              )),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16),
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            onPressed: () async {
                                              // controller.getLocPermition();
                                              await controller
                                                  .loginAPI(context);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                          height: 250,
                          width: 250,
                          child: Lottie.asset('assets/images/loading.json'))),
            ));
  }
}
