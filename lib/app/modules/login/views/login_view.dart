import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
import 'package:pawpal/loading.dart';
import 'package:pawpal/theme.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginViewWeb extends GetView<LoginController> {
  void login() async {
    final authService = AuthController();
    authService.signInWithEmailPassword(
      controller.emailC.text,
      controller.passC.text,
    );
    if (controller.emailC.text == 'admin@gmail.com') {
      // Arahkan ke halaman HOME jika aplikasi berjalan di web
      Get.offAllNamed(Routes.DASHBOARD_ADMIN);
    } else {
      // Arahkan ke halaman MainPage jika aplikasi berjalan di perangkat mobile
      Get.offAllNamed(Routes.HOME); // Ganti MainPage dengan widget utama
    }
  }

  final authC = Get.find<AuthController>();
  LoginViewWeb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.width < 900
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildWelcomeContainer(context),
                    buildLoginContainer(context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildWelcomeContainer(context),
                    buildLoginContainer(context),
                  ],
                ),
        ],
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
            "Please login to continue",
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

// Fungsi untuk membuat kontainer "Login"
  Widget buildLoginContainer(BuildContext context) {
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
              "LOGIN",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Your Email",
                prefixIcon: Icon(Icons.person_2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(height: 20),
            Container(
              width: context.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () => login(),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColors),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text(
                  "Don't have an account? Sign up",
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

// Fungsi untuk membuat kontainer "Welcome"

class LoginViewApp extends GetView<LoginController> {
  LoginViewApp({Key? key}) : super(key: key);
  void login() async {
    final authService = AuthController();
    authService.signInWithEmailPassword(
        controller.emailC.text, controller.passC.text);
  }

  final authService = AuthController();

  @override
  Widget build(BuildContext context) {
    if (authService.isLoading.value == true) {
      return LoadingView();
    }
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
                    "Please login to Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: context.width * 0.9,
                    child: TextField(
                      controller: controller.emailC,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: " Name or Email",
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
                      obscureText: true,
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
                          child: Icon(
                            controller.isPasswordObscured.value
                                ? Icons.remove_red_eye_sharp
                                : Icons.visibility_off,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  MyPButton(
                    color: Colors.white,
                    text: authService.isLoading.value == true
                        ? "Loading...."
                        : "Login",
                    textcolor: Colors.black,
                    onpress: () => login(),
                  ),
                  SizedBox(
                    height: 50,
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
                        onTap: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          " Sign Up",
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
        ));
  }
}
