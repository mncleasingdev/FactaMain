import 'package:activityapp/controller/edit_controller.dart';
import 'package:activityapp/view/listdata_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  final String trxID;
  // final controller = Get.find<EditController>();
  final controller = Get.put(EditController());
  EditPage({this.trxID});

  @override
  Widget build(BuildContext context) {
    controller.getViewData(trxID);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Activity"),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.off(() => ListDataPage());
                Get.reset();
              },
            ),
          ),
        ),
      ),
      body: Form(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Activity Info',
                        border: OutlineInputBorder()),
                    controller: controller.txtActivity),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(
                        labelText: 'Next Action and Follow up',
                        border: OutlineInputBorder()),
                    controller: controller.txtDesc),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.postActivity(trxID);
                      },
                      child: Text('Update')),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
