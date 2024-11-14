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
import '../../../widgets/part/imageslider.dart';
import '../../../widgets/tentang.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController authService = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: kIsWeb ? null : myDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          return CustomScrollView(
            slivers: [
              if (kIsWeb != true)
                SliverAppBar(
                  title: Text("Beranda"),
                  centerTitle: true,
                  pinned: true,
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.person_pin_rounded))
                  ],
                ),
              SliverPersistentHeader(
                delegate: MyDelegateClass(),
              ),
              if (screenWidth > 1100 && kIsWeb == true)
                SliverAppBar(
                  pinned: true,
                  title: MyAppbar(),
                  backgroundColor: Colors.white,
                ),
              SliverList(
                delegate: SliverChildListDelegate([
                  kIsWeb ? MyTentangWeb() : MyTentangApp(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  MyShop(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  MyLayanan(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  MyKaryawan(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  MyGaleri(),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  MyCopyright(),
                ]),
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (kIsWeb == true) {
      return ImageSliderWeb();
    } else {
      return ImageSliderApp();
    }
  }

  @override
  double get maxExtent => kIsWeb ? 600 : 250;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Mengindikasikan bahwa kita ingin membangun ulang setiap kali
  }
}
