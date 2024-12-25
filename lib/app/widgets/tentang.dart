import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/theme.dart';

class MyTentangWeb extends StatelessWidget {
  const MyTentangWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Perawatan Terbaik untuk\nHewan Kesayangan Anda!",
                      style: TextStyle(
                        fontSize: context.width > 900 ? 35 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.width > 900
                          ? "Kami memahami betapa pentingnya hewan peliharaan bagi Anda. Oleh karena itu, kami menawarkan layanan penitipan hewan yang profesional dan penuh kasih sayang. Tim kami berdedikasi untuk memberikan perawatan terbaik, sehingga Anda bisa merasa tenang soat meninggalkan hewan kesayangan Anda bersama kami"
                          : "hehe",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Kami menyediakan lingkungan yang aman dan nyaman bagi hewan peliharaan Anda. Dengan fasilitas modern dan staf yang berpengalaman, kami memastikan setiap kebutuhan hewan peliharaan Anda terpenuht mulal dari makanan sehat hingga waktu bermain yang menyenangkan.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Kepercayaan Anda adalah prioritas kami. Itulah sebabnya kami selalu berusaha untuk memberikan pelayanan terbaik dengan standar kebersihan dan kenyamanan yang tinggi.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset(
                  "assets/images/gambar.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class MyTentangApp extends StatelessWidget {
  const MyTentangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.65,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: thirdColors,
        borderRadius: BorderRadius.circular(20),
      ),
      width: context.width,
      child: Stack(
        children: [
          Container(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tentang",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 5,
                  width: 80,
                  color: primaryColors,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Perawatan Terbaik untuk\nHewan Kesayangan Anda!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Kami memahami betapa pentingnya hewan peliharaan bagi Anda. Oleh karena itu, kami menawarkan layanan penitipan hewan yang profesional dan penuh kasih sayang. Tim kami berdedikasi untuk memberikan perawatan terbaik, sehingga Anda bisa merasa tenang saat meninggalkan hewan kesayangan Anda bersama kami.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              height: context.height * 0.3,
              child: Image.asset(
                "assets/images/gambar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
