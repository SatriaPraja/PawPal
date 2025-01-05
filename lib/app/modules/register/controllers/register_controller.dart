import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC =
      TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmpassC = TextEditingController();
  var isPasswordObscured = true.obs;
  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    confirmpassC.dispose();
    super.onClose();
  }
}
