import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
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

class CardDetail1 extends StatelessWidget {
  const CardDetail1({super.key});

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
                      'Perawatan Harian dan Perhatian Pribadi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Setiap hari, hewan peliharaan Anda akan dirawat oleh tim ahli kami yang terlatih. Kami memastikan setiap hewan peliharaan mendapat perhatian individu sesuai kebutuhan mereka.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Aktivitas dan Stimulasi Mental',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menawarkan berbagai aktivitas menyenangkan dan bervariasi seperti jalan-jalan, bermain, dan permainan latihan mental untuk menjaga kesejahteraan emosional dan fisik hewan peliharaan.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pemantauan Kesehatan Harian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pemeriksaan kesehatan dasar akan dilakukan, termasuk memeriksa kebugaran fisik dan tanda-tanda kesehatan umum, untuk memastikan hewan peliharaan tetap dalam kondisi prima.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Laporan Harian Langsung',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Anda akan menerima laporan harian langsung melalui aplikasi, termasuk foto dan ringkasan aktivitas harian, sehingga Anda bisa memantau kebahagiaan hewan peliharaan Anda kapan saja.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Jaminan Kebersihan dan Kenyamanan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kebersihan dan kenyamanan hewan peliharaan adalah prioritas kami. Kami memastikan lingkungan perawatan tetap bersih, aman, dan nyaman sepanjang waktu.',
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
                        onpress: () {},
                      ),
                    )
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

class CardDetail2 extends StatelessWidget {
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
                      'Kami menyediakan layanan perawatan harian yang dirancang untuk memenuhi kebutuhan kesejahteraan dan kebahagiaan hewan peliharaan Anda. Berikut layanan-layanan yang tersedia:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Jalan-Jalan dan Aktivitas Fisik',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mengajak hewan peliharaan Anda untuk jalan-jalan dan bermain di luar setiap hari. Aktivitas fisik yang teratur membantu menjaga kebugaran dan kesehatan mental mereka.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Makan dan Pengawasan Nutrisi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami memastikan hewan peliharaan Anda mendapatkan asupan makanan yang sesuai dengan kebutuhan nutrisi mereka. Kami juga memperhatikan jadwal makan, takaran porsi, dan ketersediaan air bersih setiap saat.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Interaksi dan Sosialisasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Interaksi sangat penting untuk kebahagiaan hewan peliharaan. Kami mengajak mereka bermain, memberikan perhatian, serta berinteraksi secara sosial untuk menghindari rasa bosan dan stres.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Perawatan Diri dan Kebersihan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dari menyikat bulu hingga membersihkan telinga dan kuku, kami membantu hewan peliharaan Anda tetap bersih dan nyaman. Perawatan diri ini penting untuk menjaga kondisi fisik dan kesehatan kulit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pemantauan Kesehatan Harian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami memantau tanda-tanda vital hewan peliharaan Anda, seperti energi, nafsu makan, dan perilaku mereka, untuk memastikan kondisi mereka tetap prima. Jika ada tanda-tanda yang perlu perhatian lebih, kami akan segera menginformasikannya kepada Anda.',
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
                        onpress: () {},
                      ),
                    )
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

class CardDetail3 extends StatelessWidget {
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
                      'Pemberian Makanan Bergizi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menyediakan makanan yang dipilih secara khusus agar sesuai dengan kebutuhan nutrisi hewan peliharaan Anda. Menu makanan disesuaikan untuk mendukung kesehatan optimal dan kebahagiaan mereka.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pemeriksaan Kesehatan Rutin',
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
                      'Perawatan Kebersihan Berkala',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami menjaga kebersihan hewan peliharaan dengan mandi berkala, pembersihan telinga, kuku, dan area sensitif lainnya. Lingkungan perawatan juga dijaga tetap bersih untuk mencegah penularan penyakit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Penggunaan Produk yang Aman dan Ramah Hewan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Produk perawatan yang kami gunakan diformulasikan khusus untuk hewan peliharaan dan bebas dari bahan kimia keras, sehingga aman dan nyaman untuk kulit serta kesehatan mereka.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lingkungan yang Bersih dan Nyaman',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kami memastikan setiap ruangan dan peralatan yang digunakan dalam perawatan hewan peliharaan dibersihkan dan disterilkan secara rutin, menciptakan suasana yang aman dan tenang bagi mereka.',
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
                        onpress: () {},
                      ),
                    )
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
