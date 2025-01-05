import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/form.dart';
import 'package:pawpal/app/widgets/myformuser.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
import 'package:pawpal/loading.dart';
import 'package:pawpal/theme.dart';

class titleDetail extends StatelessWidget {
  final String title;
  const titleDetail({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      width: context.width * 0.95,
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
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 150,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CardDetail1 extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      width: context.width * 0.95,
      decoration: BoxDecoration(
        color: thirdColors,
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PawPal menyediakan layanan perawatan harian untuk memastikan hewan peliharaan Anda mendapatkan perhatian dan aktivitas yang diperlukan untuk kebahagiaan dan kesehatan mereka. Layanan ini mencakup:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1. Perawatan Harian dan Perhatian Pribadi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Setiap hari, hewan peliharaan Anda akan dirawat oleh tim ahli kami yang terlatih. Kami memastikan setiap hewan peliharaan mendapat perhatian individu sesuai kebutuhan mereka, mulai dari makanan, minuman, hingga kebutuhan emosional mereka.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Aktivitas dan Stimulasi Mental',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menawarkan berbagai aktivitas menyenangkan dan bervariasi seperti jalan-jalan, bermain, dan permainan latihan mental untuk menjaga kesejahteraan emosional dan fisik hewan peliharaan. Kami juga menyediakan permainan interaktif untuk menjaga pikiran mereka tetap aktif.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Pemantauan Kesehatan Harian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pemeriksaan kesehatan dasar akan dilakukan setiap hari, termasuk memeriksa kebugaran fisik dan tanda-tanda kesehatan umum, untuk memastikan hewan peliharaan tetap dalam kondisi prima. Kami juga memberikan suplemen atau obat yang mungkin diperlukan sesuai dengan instruksi Anda.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Laporan Harian Langsung',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Anda akan menerima laporan harian langsung melalui aplikasi, termasuk foto dan ringkasan aktivitas harian, sehingga Anda bisa memantau kebahagiaan hewan peliharaan Anda kapan saja. Kami juga menyediakan video pendek dari kegiatan harian mereka untuk memberi Anda gambaran lebih lengkap.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '5. Jaminan Kebersihan dan Kenyamanan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kebersihan dan kenyamanan hewan peliharaan adalah prioritas kami. Kami memastikan lingkungan perawatan tetap bersih, aman, dan nyaman sepanjang waktu, dengan menjaga tempat tidur mereka, menyediakan ventilasi yang baik, serta memastikan mereka tidak terpapar suhu ekstrem.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: MyPButton(
                        color: secondaryColors,
                        text: 'Pesan Sekarang',
                        textcolor: Colors.white,
                        onpress: () {
                          if (controller.isLoggedIn.value) {
                            Get.to(() => MyFormUser());
                          } else {
                            Get.snackbar("Login Diperlukan",
                                "Silakan login untuk melanjutkan");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CardDetail2 extends GetView<AuthController> {
  const CardDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      width: context.width * 0.95,
      decoration: BoxDecoration(
        color: thirdColors,
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kami menyediakan layanan konsultasi dan vaksinasi untuk memastikan hewan peliharaan Anda selalu dalam kondisi sehat dan terlindungi dari penyakit. Layanan ini mencakup:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1. Konsultasi Kesehatan Hewan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Layanan konsultasi kami memberikan kesempatan bagi Anda untuk berdiskusi langsung dengan dokter hewan profesional. Kami akan membantu Anda dalam menjawab pertanyaan tentang kesehatan hewan peliharaan Anda, termasuk gejala yang mungkin mereka alami, cara merawat mereka dengan lebih baik, serta saran untuk pencegahan penyakit. Konsultasi ini dapat dilakukan secara langsung maupun jarak jauh (online).',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Pemeriksaan Kesehatan Rutin',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menawarkan pemeriksaan kesehatan lengkap untuk memastikan hewan peliharaan Anda tetap sehat dan bebas dari penyakit. Pemeriksaan ini meliputi analisis berat badan, kondisi gigi, kulit, telinga, dan mata, serta penilaian umum terhadap kondisi fisik hewan peliharaan. Pemeriksaan rutin sangat penting untuk deteksi dini masalah kesehatan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Vaksinasi untuk Perlindungan Maksimal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Vaksinasi adalah salah satu cara terbaik untuk melindungi hewan peliharaan Anda dari penyakit serius. Kami menyediakan layanan vaksinasi untuk berbagai jenis penyakit yang umum pada hewan, seperti rabies, distemper, parvo, dan lainnya. Jadwal vaksinasi akan disesuaikan dengan usia dan kondisi kesehatan hewan peliharaan Anda, serta petunjuk dari dokter hewan kami.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Penyuluhan tentang Perawatan Kesehatan Hewan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami memberikan edukasi kepada pemilik hewan peliharaan tentang cara merawat hewan dengan benar untuk memastikan mereka selalu sehat. Ini termasuk informasi mengenai pemberian makanan yang tepat, cara menjaga kebersihan, serta tips untuk mengenali gejala penyakit dan kapan harus membawa hewan peliharaan ke dokter hewan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '5. Layanan Konsultasi Kesehatan Mental',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Selain perawatan fisik, kami juga memahami pentingnya kesehatan mental hewan peliharaan. Layanan ini mencakup saran dan konsultasi mengenai perilaku hewan peliharaan Anda, mengatasi kecemasan, stres, atau masalah perilaku lainnya. Kami bekerja sama dengan ahli perilaku hewan untuk memastikan hewan peliharaan Anda mendapatkan perawatan menyeluruh.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: MyPButton(
                        color: secondaryColors,
                        text: 'Pesan Sekarang',
                        textcolor: Colors.white,
                        onpress: () {
                          if (controller.isLoggedIn.value) {
                            Get.to(() => MyFormUser());
                          } else {
                            Get.snackbar("Login Diperlukan",
                                "Silakan login untuk melanjutkan");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CardDetail3 extends GetView<AuthController> {
  const CardDetail3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      width: context.width * 0.95,
      decoration: BoxDecoration(
        color: thirdColors,
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kesehatan dan kebersihan hewan peliharaan Anda adalah prioritas utama kami di PawPal. Kami memastikan setiap hewan peliharaan berada dalam lingkungan yang sehat, bersih, dan nyaman dengan layanan berikut:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1. Pemberian Makanan Bergizi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menyediakan makanan yang dipilih secara khusus agar sesuai dengan kebutuhan nutrisi hewan peliharaan Anda. Menu makanan disesuaikan untuk mendukung kesehatan optimal dan kebahagiaan mereka. Kami juga menyediakan pilihan makanan kering dan basah sesuai selera.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Pemeriksaan Kesehatan Rutin',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tim kami melakukan pemeriksaan kesehatan secara rutin untuk memantau kondisi fisik hewan peliharaan, termasuk pemeriksaan berat badan, kebersihan bulu, gigi, dan tanda-tanda kesehatan lainnya. Hal ini membantu dalam deteksi dini potensi masalah kesehatan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Perawatan Kebersihan Berkala',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menjaga kebersihan hewan peliharaan dengan mandi berkala, pembersihan telinga, kuku, dan area sensitif lainnya. Lingkungan perawatan juga dijaga tetap bersih untuk mencegah penularan penyakit. Kami memberikan layanan grooming berkala sesuai jadwal.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Penggunaan Produk yang Aman dan Ramah Hewan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Produk perawatan yang kami gunakan diformulasikan khusus untuk hewan peliharaan dan bebas dari bahan kimia keras, sehingga aman dan nyaman untuk kulit serta kesehatan mereka. Kami memastikan semua produk aman untuk hewan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '5. Lingkungan yang Bersih dan Nyaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami memastikan setiap ruangan dan peralatan yang digunakan dalam perawatan hewan peliharaan dibersihkan dan disterilkan secara rutin, menciptakan suasana yang aman dan tenang bagi mereka. Kami menyediakan ruangan dengan suhu yang terjaga untuk kenyamanan hewan peliharaan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: MyPButton(
                        color: secondaryColors,
                        text: 'Pesan Sekarang',
                        textcolor: Colors.white,
                        onpress: () {
                          if (controller.isLoggedIn.value) {
                            Get.to(() => MyFormUser());
                          } else {
                            Get.snackbar("Login Diperlukan",
                                "Silakan login untuk melanjutkan");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
