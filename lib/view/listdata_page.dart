import 'dart:convert';
import 'package:activityapp/controller/history_controller.dart';
import 'package:activityapp/view/edit_page.dart';
import 'package:activityapp/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class ListDataPage extends StatelessWidget {
  final histCon = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    histCon.getUserID();

    return Scaffold(
        appBar: AppBar(
          title: Text("Activity History"),
          centerTitle: true,
          leading: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.off(() => LandingPage());
                },
              ),
            ),
          ),
        ),
        body: GetBuilder<HistoryController>(builder: (controller) {
          return controller.viewList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.viewList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Dialogs.materialDialog(
                              title: 'Detail',
                              color: Colors.white,
                              context: context,
                              actions: [
                                Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      child: ListView(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 200,
                                              width: 200,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.memory(
                                                  Base64Codec().decode(
                                                      controller.viewList[index]
                                                          .image),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Activities',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.activityName,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Type Activities',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.type,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Product',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.product,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                controller.viewList[index]
                                                            ?.type ==
                                                        'Visit Supplier'
                                                    ? Column(
                                                        children: [
                                                          Text(
                                                            'Supplier',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                fit: FlexFit
                                                                    .tight,
                                                                child: Text(
                                                                  controller
                                                                      .viewList[
                                                                          index]
                                                                      ?.supplier,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                                Text(
                                                  'Bertemu dengan',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.meetupWith,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Next Action & Follow Up',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.description,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Input Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        controller
                                                            .viewList[index]
                                                            ?.inputdt,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconsButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: 'OK',
                                      iconData: Icons.done,
                                      color: Colors.blue,
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    )
                                  ],
                                ),
                              ]);
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.analytics),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              controller.viewList[index]?.type,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, bottom: 10),
                                    child: Text(
                                      controller.viewList[index]?.inputdt
                                          .toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Divider(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 120,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          Base64Codec().decode(
                                              controller.viewList[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product :",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 0, 10),
                                            child: Text(controller
                                                .viewList[index]?.product),
                                          ),
                                          controller.viewList[index]?.type ==
                                                  'Visit Supplier'
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                      Text(
                                                        "Supplier :",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 5, 0, 10),
                                                        child: Text(controller
                                                            .viewList[index]
                                                            ?.supplier),
                                                      ),
                                                    ])
                                              : Container(),
                                          Text(
                                            "Activity :",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 0, 10),
                                            child: Text(controller
                                                .viewList[index]?.activityName),
                                          ),
                                          Text(
                                            "Bertemu Dengan :",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 0, 10),
                                            child: Text(controller
                                                .viewList[index]?.meetupWith),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        Get.to(() => EditPage(
                                              trxID: controller.viewList[index]
                                                  ?.activityTrxId,
                                            ));
                                      },
                                      color: Colors.blue[900],
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                      shape: CircleBorder(),
                                      minWidth: 10,
                                    ),
                                    // MaterialButton(
                                    //   onPressed: () {},
                                    //   color: Colors.red[900],
                                    //   textColor: Colors.white,
                                    //   child: Icon(
                                    //     Icons.delete,
                                    //     size: 20,
                                    //   ),
                                    //   shape: CircleBorder(),
                                    //   minWidth: 10,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
        }));
  }
}
