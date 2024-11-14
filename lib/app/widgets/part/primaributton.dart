import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';

class MyPButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textcolor;
  final VoidCallback onpress;
  const MyPButton({
    required this.color,
    required this.text,
    required this.textcolor,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Mengatur warna tombol menjadi biru
      ),
      child: Container(
        width: context.width * 0.75,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
