import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/layanan.dart';
import 'package:pawpal/app/widgets/layanancard.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';

import '../controllers/layanan_controller.dart';

class LayananView extends GetView<LayananController> {
  LayananView({Key? key}) : super(key: key);
  final List<IconData> icon = [
    Icons.monitor_heart_rounded,
    Icons.remove_red_eye_sharp,
    Icons.shield,
  ];
  final List<String> title = [
    'Perawatan Harian',
    'Pengawasan Khusus',
    'Kesehatan dan Kebersihan',
  ];
  final List<String> desc = [
    'Kami menyediakan layanan perawatan harian yang memastikan hewan peliharaan Anda mendapatkan perhatian dan aktivitas yang mereka butuhkan untuk kebahagiaan dan kesejahteraan mereka.',
    'Kami menyediakan layanan pengawasan khusus untuk hewan peliharaan yang memerlukan perhatian ekstra. Staf berpengalaman kami memberikan perawatan tepat, termasuk obat-obatan jika diperlukan.',
    'Kesehatan dan kebersihan hewan peliharaan Anda adalah prioritas kami. Kami menyediakan makanan bergizi, pemeriksaan kesehatan rutin, dan lingkungan bersih untuk menjaga kesehatan dan kebahagiaan mereka.',
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: kIsWeb ? null : myDrawer(),
      appBar: screenWidth > 1000 && kIsWeb
          ? AppBar(
              title: MyAppbar(),
              automaticallyImplyLeading: !kIsWeb,
              leading: kIsWeb ? null : null,
            )
          : AppBar(
              title: Text("Layanan"),
              centerTitle: true,
            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
