import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pawpal/theme.dart';

class MyCopyright extends StatelessWidget {
  const MyCopyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: primaryColors,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "PawPal",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Tentang",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Layanan",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Karyawan",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Galeri",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Tetap terhubung dengan kami melalui media sosial kami dan jangan ragu untuk menghubungi tim dukungan kami untuk bantuan lebih lanjut.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset("assets/images/medsos.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            alignment: Alignment.center,
            color: secondaryColors,
            child: Text(
              "© 2024 Copyright: PawPal",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
