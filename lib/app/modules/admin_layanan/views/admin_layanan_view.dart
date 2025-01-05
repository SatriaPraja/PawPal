import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/form.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';

import '../controllers/admin_layanan_controller.dart';

class AdminLayananView extends GetView<AdminLayananController> {
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = context.width;
    final isSmallScreen = ScreenWidth < 1100;
    return Scaffold(
      appBar: isSmallScreen
          ? PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SafeArea(child: MyAppbarAdmin()),
            )
          : null,
      drawer: isSmallScreen
          ? MyDrawerAdmin(
              activeRoute: ModalRoute.of(context)?.settings.name ?? "")
          : null,
      body: Row(
        children: [
          if (!isSmallScreen)
            SizedBox(
              width: 300,
              child: MyDrawerAdmin(
                  activeRoute: ModalRoute.of(context)?.settings.name ?? ""),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 0 : 20,
                      ),
                      child: MyForm(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
