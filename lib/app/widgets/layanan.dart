import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/layanancard.dart';
import 'package:pawpal/app/widgets/layananhome.dart';
import 'package:pawpal/theme.dart';

class MyLayanan extends StatelessWidget {
  MyLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
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
                    "Setiap tindakan yang kami lakukan, kami lakukan dengan penuh kasih sayang dan perhatian terhadap setiap hewan kesayangan Anda. Kami memahami betapa berharganya mereka dalam hidup Anda, dan itulah mengapa kami memastikan semua layanan kami didasarkan pada empati dan dedikasi untuk kebutuhan mereka.",
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
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: MyLayananMenu(),
          ),
        ],
      ),
    );
  }
}
