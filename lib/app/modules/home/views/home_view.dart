import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/modules/profile/views/profile_view.dart';
import 'package:pawpal/app/modules/shop/views/shop_view.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/galeri.dart';

import 'package:pawpal/app/widgets/karyawan.dart';
import 'package:pawpal/app/widgets/layanan.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/app/widgets/shop.dart';
import 'package:pawpal/theme.dart';
import '../../../widgets/part/imageslider.dart';
import '../../../widgets/tentang.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController authService = AuthController();

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = ScreenWidth < 1100;
    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
        // Menonaktifkan drawer di AppBar jika tidak diperlukan untuk layar besar
        automaticallyImplyLeading:
            false, // Membuat tombol drawer di AppBar hanya muncul pada layar kecil
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MyDelegateClass(),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  !isSmallScreen ? MyTentangWeb() : MyTentangApp(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([MyShop()]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([MyLayanan()]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([MyKaryawan()]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([MyGaleri()]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([MyCopyright()]),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyDelegateClass extends SliverPersistentHeaderDelegate {
  @override
  final screenWidth = Get.width;
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ImageSliderApp();

    // if (kIsWeb == true) {
    //   return ImageSliderWeb();
    // } else {
    //   return ImageSliderApp();
    // }
  }

  @override
  double get maxExtent =>
      screenWidth > 1100 ? Get.height * 0.8 : Get.height * 0.41;

  @override
  double get minExtent =>
      screenWidth > 1100 ? Get.height * 0.8 : Get.height * 0.41;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Mengindikasikan bahwa kita ingin membangun ulang setiap kali
  }
}
