import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/app/widgets/tentang.dart';

import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  const TentangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = ScreenWidth < 1100;
    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
        automaticallyImplyLeading: false,
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: SingleChildScrollView(
          child: Column(
        children: [
          !isSmallScreen ? MyTentangWeb() : MyTentangApp(),
          MyCopyright(),
        ],
      )),
    );
  }
}
