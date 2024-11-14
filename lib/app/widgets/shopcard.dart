import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/theme.dart';

class MyShopCard extends StatelessWidget {
  const MyShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
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
              "assets/images/shop1.png",
              fit: BoxFit.cover,
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
                  "Drools | 3KG",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Adult chicken and egg Egg, Chicken 3 kg Dry Adult Dog Food",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all()),
                    child: Text("Beli Sekarang"),
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
