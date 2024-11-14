import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/layanancard.dart';

class MyLayananMenu extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildCards(),
          );
        }
      },
    );
  }
}
