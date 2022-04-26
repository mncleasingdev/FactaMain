import 'package:activityapp/controller/input_controller.dart';
import 'package:activityapp/controller/validation.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/landing_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InputPage extends StatelessWidget with validationInput {
  final inputCon = Get.put(InputController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Input Field Activities"),
          centerTitle: true,
          leading: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.off(() => LandingPage());
                  Get.reset();
                },
              ),
            ),
          ),
        ),
        body: GetX<InputController>(builder: (controller) {
          return controller.isLoading.value == false
              ? Listener(
                  onPointerDown: (_) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.focusedChild?.unfocus();
                    }
                  },
                  child: Form(
                    key: formKey,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(children: [
                          Container(
                              margin: EdgeInsets.all(20),
                              child: DropdownSearch<String>(
                                  mode: Mode.DIALOG,
                                  label: 'Type',
                                  validator: validateType,
                                  showSelectedItem: true,
                                  items: controller.typeList == null
                                      ? []
                                      : controller.typeList,
                                  hint: "Please select type",
                                  onChanged: (String newType) {
                                    controller.selectedType.value = newType;
                                  })),
                          Container(
                              margin: EdgeInsets.all(20),
                              child: DropdownSearch<String>(
                                  mode: Mode.DIALOG,
                                  label: 'Product',
                                  validator: validateProduct,
                                  showSelectedItem: true,
                                  items: controller.productList == null
                                      ? []
                                      : controller.productList,
                                  hint: "Please select supported product",
                                  onChanged: (String newval) {
                                    controller.selectedProduct.value = newval;
                                    if (controller.selectedType.value ==
                                        'Visit Supplier') {
                                      controller.loadSupplierByProduct(newval);
                                    }
                                  })),
                          controller.selectedType.value == 'Visit Supplier'
                              ? Container(
                                  margin: EdgeInsets.all(20),
                                  child: DropdownSearch<String>(
                                      mode: Mode.DIALOG,
                                      label: 'Supplier',
                                      showSearchBox: true,
                                      showSelectedItem: true,
                                      validator: validateSupplier,
                                      items: controller.suppList == null
                                          ? []
                                          : controller.suppList,
                                      hint: "Please select supplier",
                                      searchBoxController:
                                          controller.txtProduct,
                                      onChanged: (String newSuppl) {
                                        controller.selectedSupplier.value =
                                            newSuppl;
                                      }))
                              : Container(),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: TextFormField(
                                validator: validateBDS,
                                decoration: InputDecoration(
                                    labelText: 'Bertemu dengan siapa',
                                    border: OutlineInputBorder()),
                                controller: controller.txtMeetupWith),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: TextFormField(
                                validator: validateActivity,
                                decoration: InputDecoration(
                                    labelText: 'Activity Info',
                                    border: OutlineInputBorder()),
                                controller: controller.txtActivity),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: TextFormField(
                                maxLines: null,
                                validator: validateDesc,
                                decoration: InputDecoration(
                                    labelText: 'Next Action and Follow up',
                                    border: OutlineInputBorder()),
                                controller: controller.txtDesc),
                          ),
                          Container(
                              margin: EdgeInsets.all(20),
                              child: Text('Upload Photo')),
                          Container(
                            child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    controller.showPicker(context);
                                  },
                                  child: Container(
                                    child: controller.isUploaded.value == true
                                        ? Container(
                                            height: 300,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200]),
                                            child: Image.file(
                                              controller.flImage,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : Container(
                                            height: 300,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200]),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      // controller.getLocation();
                                      controller.saveAPI(context);
                                    }
                                  },
                                  child: Text('Submit')),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Container(
                      height: 250,
                      width: 250,
                      child: controller.typeLoading.value == 'Save'
                          ? Lottie.asset('assets/images/writing.json')
                          : Lottie.asset('assets/images/loading.json')));
        }));
  }
}
