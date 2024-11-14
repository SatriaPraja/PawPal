import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/tentang.dart';

import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  const TentangView({Key? key}) : super(key: key);
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
          child: kIsWeb ? MyTentangWeb() : MyTentangApp(),
        ),
      ),
    );
  }
}
