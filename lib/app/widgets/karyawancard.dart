import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/theme.dart';

class MyKaryawanCard extends StatelessWidget {
  final String image;
  final String name;
  final int index; // Untuk menampilkan urutan karyawan

  MyKaryawanCard(
      {required this.image, required this.name, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: thirdColors,
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        width: screenWidth > 1000 ? screenWidth * 0.2 : screenWidth * 0.35,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              width: Get.width,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: Get.width,
              decoration: BoxDecoration(
                color: primaryColors,
              ),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Karyawan ${index + 1}", // Menampilkan urutan karyawan
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
