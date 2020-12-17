import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ex1/models/users.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User _user;

  User get user => _user;
  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChange(String text){
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: user.isViewUser);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
          title: Text('ERROR'),
          message: Text('Vui lòng nhập một giá trị hợp lệ'),
          cancelButton: CupertinoActionSheetAction(
            child: Text('chấp nhận'.toUpperCase()),
            onPressed: () => Get.back(),
          ),
        ),
      );
    }
  }
}
