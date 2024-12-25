import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/app/modules/login/controllers/login_controller.dart';
import 'package:pawpal/app/modules/tentang/views/tentang_view.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/loading.dart';
import 'package:pawpal/theme.dart';

import '../controllers/auth_controller.dart';
import '../routes/app_pages.dart';

class MyAppbar extends GetView<LoginController> {
  final AuthController authService = AuthController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = screenWidth < 1100;

    return AppBar(
      backgroundColor: Colors.white,
      title: LayoutBuilder(
        builder: (context, constraints) {
          double baseFontSize = screenWidth < 600 ? 14 : 16;
          double titleFontSize = screenWidth < 600 ? 18 : 20;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isSmallScreen) ...[
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Get.offAllNamed(Routes.HOME),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 25,
                      ),
                    ),
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isSmallScreen) ...[
                      // Menu hanya ditampilkan pada layar besar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildMenuItem("BERANDA", Routes.HOME),
                          _buildMenuItem("TENTANG", Routes.TENTANG),
                          _buildMenuItem("LAYANAN", Routes.LAYANAN),
                          _buildMenuItem("KARYAWAN", Routes.KARYAWAN),
                          _buildMenuItem("GALERI", Routes.GALERI),
                          _buildMenuItem("SHOP", Routes.SHOP),
                        ],
                      ),
                    ],
                  ],
                ),
                StreamBuilder<User?>(
                  stream: authService.streamAuthStatus,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Row(
                        children: [
                          snapshot.data != null ? MyProfile() : MyAuth(),
                        ],
                      );
                    }
                    return LoadingView();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk membangun item menu
  Widget _buildMenuItem(String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.offAllNamed(route),
          child: Text(
            title,
            style: GoogleFonts.righteous(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.PROFILE);
      },
      child: CircleAvatar(
        radius: 20, // Sesuaikan ukuran avatar
        backgroundImage: AssetImage(
          "assets/images/profile.jpg",
        ), // Ganti dengan URL gambar pengguna
      ),
    );
  }
}

class MyAuth extends StatelessWidget {
  const MyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColors,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              "SIGN IN",
              style: GoogleFonts.righteous(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.REGISTER);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: thirdColors,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              "SIGN UP",
              style: GoogleFonts.righteous(
                fontSize: 16,
                color: secondaryColors,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
                  // Row(
                  //   children: [
                  //     Obx(() {
                  //       if (authService.isLoggedIn.value == false) {
                  //         // Jika sudah login, tampilkan avatar bulat
                  //         return GestureDetector(
                  //           onTap: () {
                  //             // Tambahkan aksi untuk avatar, misalnya menampilkan profil
                  //           },
                  //           child: CircleAvatar(
                  //             radius: 20, // Sesuaikan ukuran avatar
                  //             backgroundImage: AssetImage(
                  //               "assets/images/profile.jpg",
                  //             ), // Ganti dengan URL gambar pengguna
                  //           ),
                  //         );
                  //       } else {
                  //         return Row(
                  //           children: [
                  //             GestureDetector(
                  //               onTap: () {
                  //                 Get.toNamed(Routes.LOGIN);
                  //               },
                  //               child: Container(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: 20, vertical: 8),
                  //                 decoration: BoxDecoration(
                  //                   color: primaryColors,
                  //                   borderRadius: BorderRadius.circular(7),
                  //                 ),
                  //                 child: Text(
                  //                   "SIGN IN",
                  //                   style: GoogleFonts.righteous(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         );
                  //       }
                  //     }),
                  //   ],
                  // ),
                  // GestureDetector(
                  //   onTap: () => authService.logout(),
                  //   child: Text(
                  //     "Logout",
                  //     style: TextStyle(
                  //       fontSize: baseFontSize,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),
