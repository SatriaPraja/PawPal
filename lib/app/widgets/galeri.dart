import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/widgets/galericard.dart';
import 'package:pawpal/theme.dart';

class MyGaleri extends StatelessWidget {
  final List<String> images = [
    'assets/images/product-1.jpg',
    'assets/images/product-2.jpg',
    'assets/images/product-3.jpg',
    'assets/images/product-4.jpg',
  ];
  final List<String> names = [
    'Smoothie',
    'Tiger',
    'Kiwi',
    'Domge',
  ];
  final List<String> desc = [
    'Kucing Persia',
    'Kucing domestik',
    'Golden Retriever',
    'Shiba inu',
  ];

  final List<String> owner = [
    'Anna',
    'Dian',
    'Clara',
    'Dimas',
  ];
  final List<String> type = [
    'Kucing',
    'Kucing',
    'Anjing',
    'Anjing',
  ];

  @override
  Widget build(BuildContext context) {
    final AuthController authService = AuthController();
    final List<Color> typeColors = type.map((type) {
      return type == 'Kucing' ? Colors.yellow : Colors.red;
    }).toList();
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            width: context.width * 0.9,
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
                          "Pawpal Galeri",
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
                    "Mari rasakan momen-momen penuh cinta bersama PawPal. Lihat bagaimana kami menciptakan kebahagiaan bagi hewan kesayangan Anda, di mana mereka akan merasa dicintai, dirawat, dan senang berada di sekitar kami. Saksikan sendiri kehangatan yang kami berikan di setiap momen perawatan mereka bersama PawPal.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kIsWeb ? 20 : 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              // Fungsi untuk membangun kartu secara dinamis
              List<Widget> buildCards() {
                return List.generate(images.length, (index) {
                  return MyGaleriCard(
                    index: index,
                    image: images[index],
                    name: names[index],
                    desc: desc[index],
                    owner: owner[index],
                    type: type[index],
                    typecolor: typeColors[index],
                  );
                });
              }

              // Jika layar kurang dari 1000, tampilkan dengan Column; jika tidak, gunakan Row dengan Wrap
              if (screenWidth < 1000) {
                // Jika lebar layar < 1000, gunakan Column dengan Wrap
                return Column(
                  children: [
                    Wrap(
                      spacing: 10.0, // Spasi horizontal antar card
                      runSpacing: 10.0, // Spasi vertikal antar baris card
                      children: buildCards(),
                    ),
                  ],
                );
              } else {
                // Jika lebar layar >= 1000, gunakan Row dengan Wrap
                return Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 10.0, // Spasi antar card
                        runSpacing: 10.0,
                        alignment: WrapAlignment.center,
                        children: buildCards(),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
