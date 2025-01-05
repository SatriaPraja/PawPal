import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/modules/home/controllers/home_controller.dart';
import 'package:pawpal/app/modules/home/views/home_view.dart';
import 'package:pawpal/app/modules/layanan/views/layanan_view.dart';
import 'package:pawpal/app/modules/mylayanan/views/mylayanan_view.dart';
import 'package:pawpal/app/modules/shop/views/shop_view.dart';
import 'package:pawpal/app/modules/profile/views/profile_view.dart';
import 'package:pawpal/loading.dart';
import 'package:pawpal/theme.dart';

class MainPage extends StatelessWidget {
  final HomeController controller = HomeController();
  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (authC.isLoading.value == true) {
          return LoadingView();
        } else {
          return IndexedStack(
            index: controller.currentIndex.value,
            children: [
              HomeView(),
              LayananView(),
              MylayananView(),
              ProfileView(),
            ],
          );
        }
        // Gunakan IndexedStack untuk mempertahankan halaman yang sudah dibuka
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: thirdColors,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeIndex(index),
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Layanan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "LayananKu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
