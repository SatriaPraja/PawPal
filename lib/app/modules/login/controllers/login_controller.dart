import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller untuk input email dan password
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  // FocusNode untuk menangani interaksi dengan keyboard

  // Obscure text untuk mengontrol apakah password disembunyikan atau tidak
  var isPasswordObscured = true.obs;

  @override
  void onInit() {
    super.onInit(); // Inisialisasi FocusNode untuk password
  }

  @override
  void onClose() {
    // Dispose TextEditingController dan FocusNode saat tidak digunakan lagi
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
