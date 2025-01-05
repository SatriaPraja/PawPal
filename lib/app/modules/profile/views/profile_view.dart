import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileController profilC = Get.put(ProfileController());
  AuthController authC = AuthController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = ScreenWidth < 1100;

    return Scaffold(
      appBar: AppBar(
        title: MyAppbar(),
        automaticallyImplyLeading: false,
      ),
      drawer: isSmallScreen ? myDrawer() : null,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              StreamBuilder<User?>(
                stream:
                    authC.streamAuthStatus, // Mendengarkan status autentikasi
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Menunggu status
                  }

                  // Cek apakah pengguna sedang login
                  User? user = snapshot.data;
                  if (user == null) {
                    return Text(
                        "Belum login"); // Tampilkan teks jika tidak ada pengguna
                  }

                  // Mengambil data pengguna dari Firestore berdasarkan UID
                  return FutureBuilder<DocumentSnapshot>(
                    future: firestore.collection('users').doc(user.uid).get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Menunggu data Firestore
                      }

                      if (snapshot.hasError) {
                        return Text("Error fetching user data");
                      }

                      // Ambil data nama dan email dari Firestore
                      var userData = snapshot.data;
                      if (userData == null || !userData.exists) {
                        return Text("Data pengguna tidak ditemukan");
                      }

                      String name = userData['name'] ?? 'Nama Tidak Tersedia';
                      String email =
                          userData['email'] ?? 'Email Tidak Tersedia';
                      String? photoUrl = user.photoURL;

                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: photoUrl != null
                                  ? NetworkImage(photoUrl)
                                  : AssetImage(
                                      "assets/images/person.png",
                                    ) as ImageProvider,
                              radius: 50,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            email,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: context.width * 0.9,
                  decoration: BoxDecoration(color: thirdColors),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Akun Saya",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.co_present_outlined),
                          SizedBox(width: 20),
                          Text("Informasi Pribadi",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.language_rounded),
                              SizedBox(width: 20),
                              Text("Bahasa", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Text("Bahasa (ID)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.privacy_tip),
                          SizedBox(width: 20),
                          Text("Kebijakan Privasi",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 20),
                          Text("Pengaturan", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                width: context.width * 0.9,
                decoration: BoxDecoration(color: thirdColors),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notifikasi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notifications_active_outlined),
                            SizedBox(width: 20),
                            Text("Notifikasi Push",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: controller.isSwitchedOn1.value,
                            onChanged: (value) {
                              controller.toggleSwitch1(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notification_add_outlined),
                            SizedBox(width: 20),
                            Text("Notifikasi Promosi",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: controller.isSwitchedOn2.value,
                            onChanged: (value) {
                              controller.toggleSwitch2(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                width: context.width * 0.9,
                decoration: BoxDecoration(color: thirdColors),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lainnya",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.help_outline_outlined),
                        SizedBox(width: 20),
                        Text("Pusat Bantuan", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Get.find<AuthController>().Logout(),
                          child: Text("Logout", style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
