import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';

import '../controllers/mylayanan_controller.dart';

class MylayananView extends GetView<MylayananController> {
  const MylayananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Periksa apakah user sudah login
    User? currentUser = _auth.currentUser;

    final ScreenWidth = MediaQuery.of(context).size.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = ScreenWidth < 1100;

    if (currentUser == null) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            child: MyAppbar(),
          ),
        ),
        drawer: isSmallScreen ? myDrawer() : null,
        body: const Center(
          child: Text('Anda belum login.'),
        ),
      );
    }

    // Mendapatkan userId yang sedang login
    String userId = currentUser.uid;

    // Membuat stream untuk mendapatkan layanan berdasarkan userId
    Stream<QuerySnapshot> layananStream = _firestore
        .collection('layanan')
        .where('userId', isEqualTo: userId)
        .orderBy('checkInDate', descending: true)
        .snapshots();

    return Scaffold(
      // appBar: MyAppbar()
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: MyAppbar(),
        ),
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: StreamBuilder<QuerySnapshot>(
        stream: layananStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Error fetching data: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print('No data found for userId: $userId');
            return const Center(child: Text('Tidak ada data layanan.'));
          }

          final layananList = snapshot.data!.docs;
          return ListView.builder(
            itemCount: layananList.length,
            itemBuilder: (context, index) {
              var layanan = layananList[index];
              print('Layanan: ${layanan.data()}');
              final checkInDate =
                  DateTime.parse(layanan['checkInDate'].toString());

              final checkOutDate = layanan['checkOutDate'] != null
                  ? DateTime.tryParse(layanan['checkOutDate'].toString())
                  : null;
              return Container(
                width: context.width,
                margin: EdgeInsets.symmetric(
                    horizontal: context.width * 0.02, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: context.height * 0.25,
                      width: context.width * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: layanan['status'] == 'pending'
                            ? Colors.red
                            : primaryColors,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize:
                            MainAxisSize.min, // Sesuaikan ukuran dengan konten
                        children: [
                          for (var char in (layanan['status'] ??
                                  '') // Beri nilai default jika null
                              .toString() // Pastikan menjadi string
                              .toUpperCase() // Mengubah semua huruf menjadi huruf besar
                              .split('')) // Memecah menjadi karakter per huruf
                            Text(
                              char,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Warna huruf
                                fontSize: 16, // Ukuran huruf
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      width: context.width * 0.88,
                      height: context.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(
                              layanan['layanan'] == 'Penitipan Hewan'
                                  ? '${layanan['layanan']} - ${layanan['days']} Hari'
                                  : layanan['layanan'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text(
                              '${checkInDate.year}-${checkInDate.month.toString().padLeft(2, '0')}-${checkInDate.day.toString().padLeft(2, '0')}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Hewan : ${layanan['petName']}",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Jenis Hewan  : ${layanan['petType']}",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Biaya               : Rp ${layanan['price']}",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  layanan['status'] == 'pending'
                                      ? ''
                                      : "Check Out : ${checkOutDate?.year}-${checkOutDate?.month.toString().padLeft(2, '0')}-${checkOutDate?.day.toString().padLeft(2, '0')}", // Tanggal
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColors,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
