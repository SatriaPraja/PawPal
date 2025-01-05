import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/copyright.dart';
import 'package:pawpal/app/widgets/karyawancard.dart';
import 'package:pawpal/theme.dart';

class MyKaryawan extends StatelessWidget {
  final List<String> images = [
    'assets/images/trainer-1.jpg',
    'assets/images/trainer-2.jpg',
    'assets/images/trainer-3.jpg',
    'assets/images/trainer-4.jpg',
  ];
  final List<String> names = [
    'Flora Nyra',
    'Taytum Ellia',
    'Evander Mac',
    'Wylder Elio',
  ];

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = ScreenWidth < 1100;
    return Container(
      child: Column(
        children: [
          // title
          SizedBox(height: 30),
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
                          "Karyawan",
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
                    "Bukan hanya sekadar pelayanan biasa, kami menjadikan keamanan dan kesejahteraan hewan kesayangan Anda sebagai prioritas utama. Kami selalu berupaya menciptakan lingkungan yang nyaman dan aman, sehingga Anda bisa merasa tenang saat mereka berada dalam perawatan kami.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: !isSmallScreen ? 16 : 14,
                    ),
                    textAlign: TextAlign.justify,
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

              // Fungsi untuk membangun card secara dinamis dengan List
              List<Widget> buildCards() {
                return List.generate(images.length, (index) {
                  return MyKaryawanCard(
                    image: images[index],
                    name: names[index],
                    index: index,
                  );
                });
              }

              // Layout responsif berdasarkan lebar layar
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
          
        ],
      ),
    );
  }
}
