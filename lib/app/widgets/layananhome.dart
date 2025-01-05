import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/layanancard.dart';

class MyLayananMenu extends StatelessWidget {
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
    final screenWidth = context.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        // Fungsi untuk membangun card secara dinamis dengan List
        List<Widget> buildCards() {
          return List.generate(icon.length, (index) {
            return MyLayananCardMenu(
              icon: icon[index],
              title: title[index],
              ontap: () {
                Get.toNamed(
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buildCards()
                .expand((card) => [
                      card,
                    ])
                .toList(),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: buildCards(),
          );
        }
      },
    );
  }
}
