import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

printDebug(String message){
  if (kDebugMode) {
    print("MESSAGE: $message");
  }
}
showToastMessage(String message) {
  Get.snackbar(
    "Information",
    message,
    colorText: Colors.white,
    backgroundColor: Colors.grey.shade900,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    icon: const Icon(Icons.info_outline, color: Colors.white,),
  );
}