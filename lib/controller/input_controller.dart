import 'dart:convert';
import 'dart:io';
import 'package:activityapp/model/activity_param.dart';
import 'package:activityapp/service/act_api.dart';
import 'package:activityapp/utils/environment.dart';
import 'package:activityapp/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class InputController extends GetxController {
  var isLoading = false.obs;
  var typeLoading = ''.obs;
  var isUploaded = false.obs;

  LocationData curlocationData;
  File flImage;
  String base64Image;

  var selectedType = ''.obs;
  var selectedProduct = ''.obs;
  var selectedSupplier = ''.obs;

  var typeList = <String>[].obs;
  var productList = <String>[].obs;
  var suppList = <String>[].obs;

  TextEditingController txtActivity = TextEditingController();
  TextEditingController txtType = TextEditingController();
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtMeetupWith = TextEditingController();

  String titleDialog;
  String contentDialog;

  final picker = ImagePicker();

  @override
  void onInit() {
    isValidLogin();
    getDropdownlist();
    super.onInit();
  }

  Future getLocation() async {
    try {
      Location location = new Location();
      curlocationData = await location.getLocation();
      update();
    } catch (err) {
      return;
    }
  }

  Future getImageFromCam() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      flImage = File(pickedFile.path);
      isUploaded(true);
      update();
    }
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    flImage = File(pickedFile.path);
    update();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  // new ListTile(
                  //     leading: new Icon(Icons.photo_library),
                  //     title: new Text('Photo Library'),
                  //     onTap: () {
                  //       getImageFromGallery();
                  //       Navigator.of(context).pop();
                  //     }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCam();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getDropdownlist() async {
    getLoadingScreen('LoadData', true);
    try {
      // if (typeList == null) typeList = await getDropdownType();
      // if (productList == null) productList = await getDropdownProduct();
      // if (suppList == null) suppList = await getDropdownSupplier();

      typeList.value = await getDropdownType();
      productList.value = await getDropdownProduct();
      // suppList.value = await getDropdownSupplier();
      suppList.value = await getDropdownSupplierByProduct('ALL');
    } catch (err) {
      debugPrint(err.toString());
    }
    getLoadingScreen('LoadData', false);
  }

  loadSupplierByProduct(String product) async {
    // getLoadingScreen('LoadData', true);
    try {
      selectedType.value = '';
      selectedSupplier.value = '';
      if (product == 'Haji/Syariah') {
        suppList.value = await getDropdownSupplierByProduct('HAJI');
      } else {
        suppList.value = await getDropdownSupplierByProduct('ALL');
      }
      selectedType.value = 'Visit Supplier';
    } catch (err) {
      debugPrint(err.toString());
    }
    // getLoadingScreen('LoadData', false);
  }

  void getLoadingScreen(String loadType, bool isActive) {
    typeLoading.value = loadType;
    isLoading(isActive);
  }

  saveAPI(BuildContext context) async {
    try {
      if (checkImage(context) == false) {
        return;
      }

      Location location = new Location();
      PermissionStatus locpermit = await location.hasPermission();
      if (locpermit == PermissionStatus.denied) {
        titleDialog = 'Error';
        contentDialog = 'Could not find current location';
        showDialogWidget(context, titleDialog, contentDialog);
        return;
      } else {
        curlocationData = await location.getLocation();
      }

      base64Image = base64Encode(flImage.readAsBytesSync());

      var actParam = new ActivityParam();
      actParam.activity = txtActivity.text;
      actParam.desc = txtDesc.text;
      actParam.type = selectedType.value;
      actParam.image = base64Image;
      actParam.longitude = curlocationData.longitude.toString();
      actParam.latitude = curlocationData.latitude.toString();
      actParam.username = prefUserName;
      actParam.visitDuration = '0';
      actParam.product = selectedProduct.value;
      actParam.meetupWith = txtMeetupWith.text;

      if (selectedType.value == 'Visit Supplier') {
        actParam.supplier = selectedSupplier.value;
      } else {
        actParam.supplier = '';
      }

      getLoadingScreen('Save', true);
      await callActivity(actParam);
      clearAll();
      getLoadingScreen('Save', false);

      titleDialog = 'Info';
      contentDialog = 'Data berhasil di submit';
      showDialogWidget(context, titleDialog, contentDialog);
    } catch (err) {
      isLoading(false);
      titleDialog = 'Error';
      contentDialog = err.toString();
      showDialogWidget(context, titleDialog, contentDialog);
      return;
    }
  }

  clearAll() {
    txtActivity.clear();
    txtDesc.clear();
    txtMeetupWith.clear();
    flImage = null;
    isUploaded(false);
    update();
  }

  checkImage(BuildContext context) {
    if (flImage == null) {
      titleDialog = 'Error';
      contentDialog = 'Image is empty';
      showDialogWidget(context, titleDialog, contentDialog);
      return false;
    } else {
      return true;
    }
  }

  isValidLogin() async {
    getLoginExist();
    if (prefUserName == '') {
      Get.off(() => LoginPage());
      Get.reset();
    }
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
