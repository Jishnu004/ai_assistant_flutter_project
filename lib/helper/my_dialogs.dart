import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs {
  //info
  static void info(String msg) {
    Get.snackbar(
      'Info',
      msg,
      backgroundGradient: LinearGradient(
        colors: [Colors.purple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      colorText: Colors.black45,
    );
  }

  //success
  static void success(String msg) {
    Get.snackbar(
      'Success',
      msg,
      backgroundGradient: LinearGradient(
        colors: [Colors.green, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      colorText: Colors.black54,
    );
  }

  //error
  static void error(String msg) {
    Get.snackbar(
      'Error',
      msg,
      backgroundGradient: LinearGradient(
        colors: [Colors.red, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      colorText: Colors.black45,
    );
  }

// loading dialog
  static void showLoadingDialog() {
    Get.dialog(Center(
      child: CustomLoading(),
    ));
  }
}
