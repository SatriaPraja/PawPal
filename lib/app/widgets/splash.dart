import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
import 'package:pawpal/theme.dart';

import '../routes/app_pages.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 250,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyPButton(
                color: primaryColors,
                text: "Get Started",
                textcolor: Colors.white,
                onpress: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
