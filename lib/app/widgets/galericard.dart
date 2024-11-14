import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/theme.dart';

class MyGaleriCard extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String owner;
  final String type;
  final Color typecolor;
  final int index; // Untuk menampilkan urutan karyawan

  MyGaleriCard({
    required this.image,
    required this.name,
    required this.index,
    required this.desc,
    required this.owner,
    required this.type,
    required this.typecolor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    return Container(
      decoration: BoxDecoration(
        color: thirdColors,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        width: screenWidth > 1000 ? screenWidth * 0.2 : screenWidth * 0.4,
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: kIsWeb ? 20 : 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          owner,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: typecolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            type,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
