import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/theme.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/part/primaributton.dart';
import '../controllers/register_controller.dart';

class RegisterViewWeb extends GetView<RegisterController> {
  void register() async {
    final authService = AuthController();

    // Validasi input kosong
    if (controller.emailC.text.isEmpty ||
        controller.passC.text.isEmpty ||
        controller.confirmpassC.text.isEmpty ||
        controller.nameC.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field harus diisi",
      );
      return;
    }

    // Validasi password
    if (controller.passC.text != controller.confirmpassC.text) {
      Get.snackbar(
        "Error",
        "Password tidak sama",
      );
      return;
    }

    try {
      // Mencoba mendaftarkan pengguna
      await authService.signUpWithEmailPassword(
        controller.emailC.text.trim(), // Menghapus spasi tambahan
        controller.passC.text,
        controller.nameC.text.trim(), // Menghapus spasi tambahan
      );

      // Jika berhasil, navigasi ke halaman HOME
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      // Menampilkan pesan error spesifik
      String errorMessage;
      if (e.toString().contains('email-already-in-use')) {
        errorMessage = "Email sudah digunakan.";
      } else if (e.toString().contains('invalid-email')) {
        errorMessage = "Format email tidak valid.";
      } else if (e.toString().contains('weak-password')) {
        errorMessage = "Password terlalu lemah.";
      } else {
        errorMessage = "Terjadi kesalahan. Coba lagi.";
      }

      // Menampilkan error dengan snackbar
      Get.snackbar(
        "Error",
        errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: context.width < 900
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildWelcomeContainer(context),
                  buildRegisterContainer(context),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildWelcomeContainer(context),
                  buildRegisterContainer(context),
                ],
              ),
      ),
    );
  }

  Widget buildWelcomeContainer(BuildContext context) {
    return Container(
      height: context.width < 900 ? context.height * 0.4 : context.height * 0.6,
      width: context.height * 0.7,
      decoration: BoxDecoration(
        color: primaryColors,
        borderRadius: context.width > 900
            ? BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to PawPal!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Please register to continue",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContainer(BuildContext context) {
    return Container(
      height: context.height * 0.6,
      width: context.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "REGISTER",
              style: TextStyle(
                fontSize: context.width < 900 ? 20 : 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Field untuk Nama Pengguna
            TextField(
              controller:
                  controller.nameC, // Menambahkan controller baru untuk nama
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Your Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Your Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.passC,
              obscureText: true,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Your Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.confirmpassC,
              obscureText: true,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Confirm Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: context.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () => register(),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColors),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(fontSize: 18, color: secondaryColors),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterViewApp extends GetView<RegisterController> {
  const RegisterViewApp({Key? key}) : super(key: key);
  void register() async {
    final authService = AuthController();

    // Validasi input kosong
    if (controller.emailC.text.isEmpty ||
        controller.passC.text.isEmpty ||
        controller.confirmpassC.text.isEmpty ||
        controller.nameC.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field harus diisi",
      );
      return;
    }

    // Validasi email harus menggunakan @gmail.com
    if (!controller.emailC.text.endsWith('@gmail.com')) {
      Get.snackbar(
        "Error",
        "Email harus berformat @gmail.com",
      );
      return;
    }

    // Validasi password
    if (controller.passC.text != controller.confirmpassC.text) {
      Get.snackbar(
        "Error",
        "Password tidak sama",
      );
      return;
    }

    try {
      // Mencoba mendaftarkan pengguna
      await authService.signUpWithEmailPassword(
        controller.emailC.text.trim(), // Menghapus spasi tambahan
        controller.passC.text,
        controller.nameC.text.trim(), // Menghapus spasi tambahan
      );

      // Jika berhasil, navigasi ke halaman HOME
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      // Menampilkan pesan error spesifik
      String errorMessage;
      if (e.toString().contains('email-already-in-use')) {
        errorMessage = "Email sudah digunakan.";
      } else if (e.toString().contains('invalid-email')) {
        errorMessage = "Format email tidak valid.";
      } else if (e.toString().contains('weak-password')) {
        errorMessage = "Password terlalu lemah.";
      } else {
        errorMessage = "Terjadi kesalahan. Coba lagi.";
      }

      // Menampilkan error dengan snackbar
      Get.snackbar(
        "Error",
        errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: context.height * 0.35,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Container(
            height: context.height * 0.65,
            padding: EdgeInsets.symmetric(vertical: 20),
            width: context.width,
            decoration: BoxDecoration(
                color: primaryColors,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to PawPal!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Please Register to Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: context.width * 0.9,
                  child: TextField(
                    controller: controller.nameC,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: " Name",
                      prefixIcon: Icon(
                        Icons.person_2_sharp,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: context.width * 0.9,
                  child: TextField(
                    controller: controller.emailC,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: " Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: context.width * 0.9,
                  child: Obx(
                    () => TextField(
                      obscureText: controller.isPasswordObscured.value,
                      controller: controller.passC,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: " Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Toggle nilai isPasswordObscured
                            controller.isPasswordObscured.value =
                                !controller.isPasswordObscured.value;
                          },
                          child: Icon(
                            controller.isPasswordObscured.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_sharp,
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: context.width * 0.9,
                  child: Obx(
                    () => TextField(
                      obscureText: controller.isPasswordObscured.value,
                      controller: controller.confirmpassC,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: " Confirm Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Toggle nilai isPasswordObscured
                            controller.isPasswordObscured.value =
                                !controller.isPasswordObscured.value;
                          },
                          child: Icon(
                            controller.isPasswordObscured.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_sharp,
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MyPButton(
                  color: Colors.white,
                  text: "Register",
                  textcolor: Colors.black,
                  onpress: () => register(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont’t have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.LOGIN),
                      child: Text(
                        " Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
