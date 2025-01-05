import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/modules/admin_layanan/controllers/admin_layanan_controller.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/form.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';

class MyFormUser extends GetView<AdminLayananController> {
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = context.width;
    final isSmallScreen = ScreenWidth < 1100;
    Get.lazyPut(() => AdminLayananController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SafeArea(child: MyAppbar()),
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyForm(),
            ],
          ),
        ),
      ),
    );
  }
}
