import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/galeri.dart';

import '../../../widgets/appbar.dart';
import '../controllers/galeri_controller.dart';

class GaleriView extends GetView<GaleriController> {
  const GaleriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenWidth > 1000
          ? AppBar(
              title: MyAppbar(),
              automaticallyImplyLeading: !kIsWeb,
              leading: kIsWeb ? null : null,
            )
          : null,
      body: Center(
        child: SingleChildScrollView(
          child: MyGaleri(),
        ),
      ),
    );
  }
}
