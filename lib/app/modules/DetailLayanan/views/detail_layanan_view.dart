import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/detail_layanan.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';

import '../controllers/detail_layanan_controller.dart';

class DetailLayananView extends GetView<DetailLayananController> {
  final String title;
  final String description;

  const DetailLayananView(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = ScreenWidth < 1100;
    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
        automaticallyImplyLeading: false,
        leading: null,
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              titleDetail(title: title),
              SizedBox(
                height: 20,
              ),
              if (title == 'Perawatan Harian')
                CardDetail1()
              else if (title == 'Pengawasan Khusus')
                CardDetail2()
              else if (title == 'Kesehatan dan Kebersihan')
                CardDetail3()
              else
                Text('DETAIL NOT FOUND'),
            ],
          ),
        ),
      ),
    );
  }
}
