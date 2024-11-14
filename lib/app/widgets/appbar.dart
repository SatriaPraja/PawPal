import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/app/modules/login/controllers/login_controller.dart';
import 'package:pawpal/app/modules/tentang/views/tentang_view.dart';
import 'package:pawpal/loading.dart';
import 'package:pawpal/theme.dart';

import '../controllers/auth_controller.dart';
import '../routes/app_pages.dart';

class MyAppbar extends GetView<LoginController> {
  final AuthController authService = AuthController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      title: LayoutBuilder(
        builder: (context, constraints) {
          // Mendapatkan lebar layar saat ini

          // Menyesuaikan ukuran font berdasarkan lebar layar
          double baseFontSize = screenWidth < 600 ? 14 : 16;
          double titleFontSize = screenWidth < 600 ? 18 : 20;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.HOME);
                        },
                        child: Text(
                          "BERANDA",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.TENTANG);
                        },
                        child: Text(
                          "TENTANG",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LAYANAN);
                        },
                        child: Text(
                          "LAYANAN",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.KARYAWAN);
                        },
                        child: Text(
                          "KARYAWAN",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.GALERI);
                        },
                        child: Text(
                          "GALERI",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.SHOP);
                        },
                        child: Text(
                          "SHOP",
                          style: GoogleFonts.righteous(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<User?>(
                    stream: authService.streamAuthStatus,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        print(snapshot.data);
                        return Row(
                          children: [
                            snapshot.data != null ? MyProfile() : MyAuth(),
                          ],
                        );
                      }
                      ;
                      return LoadingView();
                    }),
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
              ],
            ),
          );
        },
      ),
      centerTitle: true,
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi untuk avatar, misalnya menampilkan profil
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
