import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/karyawan.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';

import '../../../widgets/appbar.dart';
import '../controllers/karyawan_controller.dart';

class KaryawanView extends GetView<KaryawanController> {
  const KaryawanView({Key? key}) : super(key: key);
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyKaryawan(),
              SizedBox(
                height: 100,
              ),
              MyCopyright(),
            ],
          ),
        ),
      ),
    );
  }
}
