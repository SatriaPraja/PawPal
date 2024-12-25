import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/modules/shop/controllers/shop_controller.dart';
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
        ShopTitle(),
        SizedBox(
          height: 30,
        ),
        MyShopMenu()
      ],
    );
  }
}

class ShopTitle extends StatelessWidget {
  const ShopTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    return Column(
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
    );
  }
}

class MyShopMenu extends StatelessWidget {
  MyShopMenu({super.key});
  final ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      String selectedCategory = shopController.selectedCategory.value;
      List<MyShopCard> filteredCards = [];

      // Tentukan kartu yang akan ditampilkan berdasarkan kategori
      if (selectedCategory == "Semua") {
        // Jika kategori "Semua" dipilih, tambahkan kartu untuk setiap kategori
        filteredCards = [
          MyShopCard(category: "Makanan"),
          MyShopCard(category: "Alat"),
          MyShopCard(category: "Lainnya"),
          MyShopCard(category: "Makanan"), // Bisa duplikat sesuai kebutuhan
        ];
      } else {
        // Jika kategori spesifik dipilih, tampilkan hanya kategori tersebut
        for (int i = 0; i < 4; i++) {
          filteredCards.add(MyShopCard(category: selectedCategory));
        }
      }

      return Container(
        width: context.width * 0.92,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;

            if (screenWidth < 1000) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: filteredCards.length >= 2
                        ? filteredCards.sublist(0, 2)
                        : filteredCards,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (filteredCards.length > 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: filteredCards.length >= 4
                          ? filteredCards.sublist(2, 4)
                          : filteredCards.sublist(2),
                    ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: filteredCards,
              );
            }
          },
        ),
      );
    });
  }
}



