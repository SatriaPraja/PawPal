import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/modules/shop/controllers/shop_controller.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/app/widgets/shop.dart';
import 'package:pawpal/app/widgets/shopcard.dart';
import 'package:pawpal/theme.dart';

class ShopView extends GetView<ShopController> {
  ShopController shopC = Get.put(ShopController());
  final List<String> categories = [
    "Semua",
    "Makanan",
    "Alat",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return Scaffold(

      appBar: screenWidth > 1000 && kIsWeb
          ? AppBar(
              title: MyAppbar(),
              automaticallyImplyLeading: !kIsWeb,
              leading: kIsWeb ? null : null,
            )
          : AppBar(
              title: Text("Shop"),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row untuk kategori
                  Row(
                    children: categories.map((category) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Obx(() => TextButton(
                              onPressed: () {
                                controller.selectCategory(category);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    controller.selectedCategory.value ==
                                            category
                                        ? primaryColors
                                        : null,
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: controller.selectedCategory.value ==
                                          category
                                      ? Colors.white
                                      : primaryColors,
                                ),
                              ),
                            )),
                      );
                    }).toList(),
                  ),
                  // Icon Button untuk filter
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Handle filter logic here
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.05, vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: MyShopMenu(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
