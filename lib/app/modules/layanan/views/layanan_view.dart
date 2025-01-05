import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/layanan.dart';
import 'package:pawpal/app/widgets/layanancard.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';

import '../controllers/layanan_controller.dart';

class LayananView extends GetView<LayananController> {
  LayananView({Key? key}) : super(key: key);
  final List<IconData> icon = [
    Icons.pets,
    Icons.medical_services,
    Icons.bed,
  ];
  final List<String> title = [
    'Perawatan Hewan',
    'Konsultasi dan Vaksinasi',
    'Penitipan Hewan',
  ];

  final List<String> desc = [
    'Layanan perawatan harian kami memastikan hewan peliharaan Anda mendapatkan perhatian penuh, aktivitas yang bermanfaat, serta perawatan yang mendukung kebahagiaan dan kesejahteraan mereka.',
    'Kami menyediakan layanan konsultasi dan vaksinasi dengan pengawasan khusus untuk hewan peliharaan yang memerlukan perhatian ekstra, termasuk pemberian obat sesuai kebutuhan.',
    'Kami memberikan layanan penitipan hewan dengan memastikan kebersihan, kesehatan, dan makanan bergizi. Hewan peliharaan Anda akan mendapatkan perawatan penuh selama penitipan.',
  ];

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = ScreenWidth < 1100;
    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
        automaticallyImplyLeading: false,
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
                width: context.width * 0.92,
                decoration: BoxDecoration(
                  color: primaryColors,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Layanan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 80,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        kIsWeb
                            ? "Setiap tindakan yang kami lakukan, kami lakukan dengan penuh kasih sayang dan perhatian terhadap setiap hewan kesayangan Anda. Kami memahami betapa berharganya mereka dalam hidup Anda, dan itulah mengapa kami memastikan semua layanan kami didasarkan pada empati dan dedikasi untuk kebutuhan mereka."
                            : "Apa Yang Kami Lakukan, Kami Melakukan dengan Kasih Sayang dan Perhatian untuk Hewan Kesayangan Anda",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kIsWeb ? 20 : 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kIsWeb ? 30 : 10,
              ),
              Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final screenWidth = constraints.maxWidth;
                    // Fungsi untuk membangun card secara dinamis dengan List
                    List<Widget> buildCards() {
                      return List.generate(icon.length, (index) {
                        return MyLayananCard(
                          icon: icon[index],
                          title: title[index],
                          desc: desc[index],
                          onTap: () {
                            Get.offNamed(
                              Routes.DETAIL_LAYANAN,
                              parameters: {
                                'title': title[index],
                              },
                            );
                          },
                        );
                      });
                    }

                    // Layout berdasarkan lebar layar
                    if (screenWidth < 1000) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: buildCards()
                            .expand((card) => [card, SizedBox(height: 10)])
                            .toList(),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: buildCards(),
                      );
                    }
                  },
                ),
              ),
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
