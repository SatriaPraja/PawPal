import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/theme.dart';

class MyShopCard extends StatelessWidget {
  final String category;

  const MyShopCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    // Pilih gambar berdasarkan kategori
    String imagePath;
    String title;
    String desc;
    if (category == "Makanan") {
      imagePath = "assets/images/shop-food1.png";
      title = "Makanan Anjing";
      desc = "Makanan anjing dewasa 3 kg, rasa ayam dan telur, kering.";
    } else if (category == "Alat") {
      imagePath = "assets/images/shop-tools1.png";
      title = "Kandang Jaring";
      desc = "Kandang jaring kuat, ventilasi baik, mudah dibersihkan.";
    } else if (category == "Lainnya") {
      imagePath = "assets/images/shop-other1.png";
      title = "Kandang Besi";
      desc = "Kandang besi anti-karat, pintu pengaman, mudah dipasang.";
    } else {
      imagePath = "assets/images/shop1.png";
      title = "Kandang Besi";
      desc = "Makanan anjing dewasa 3 kg, rasa ayam dan telur, kering.";
    }

    return Container(
      decoration: BoxDecoration(
        color: thirdColors,
        borderRadius: BorderRadius.circular(20),
      ),
      width: screenWidth > 1000 ? context.width * 0.2 : context.width * 0.4,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: context.width * 0.2,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: kIsWeb ? context.height * 0.3 : context.height * 0.1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: kIsWeb ? 16 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: kIsWeb ? 16 : 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all()),
                      child: Text("Beli Sekarang"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
