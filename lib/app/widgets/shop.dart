import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/shopcard.dart';
import 'package:pawpal/theme.dart';

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.055),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Belanja",
                        style: TextStyle(
                          fontSize: screenWidth > 1000 ? 20 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.SHOP),
                        child: Text(
                          "Lainnya > ",
                          style: TextStyle(
                            fontSize: screenWidth > 1000 ? 20 : 16,
                            fontWeight: FontWeight.bold,
                            color: secondaryColors,
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 5,
                      width: screenWidth > 1000 ? 100 : 80,
                      color: primaryColors,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: context.width * 0.92,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              if (screenWidth < 1000) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyShopCard(),
                        MyShopCard(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyShopCard(),
                        MyShopCard(),
                      ],
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyShopCard(),
                    MyShopCard(),
                    MyShopCard(),
                    MyShopCard(),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
