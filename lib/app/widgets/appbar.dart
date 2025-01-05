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
  String getActivePageName(String routeName) {
    switch (routeName) {
      case Routes.HOME:
        return 'Home';
      case Routes.TENTANG:
        return 'Tentang';
      case Routes.LAYANAN:
        return 'Layanan';
      case Routes.KARYAWAN:
        return 'Karyawan';
      case Routes.GALERI:
        return 'Galeri';
      case Routes.SHOP:
        return 'Shop';
      case Routes.PROFILE:
        return 'Profile';
      case Routes.MAIN:
        return 'Main';
      case Routes.DETAIL_LAYANAN:
        return 'Detail Layanan';
      case Routes.MYLAYANAN:
        return 'My Layanan';
      default:
        return ''; // Default jika tidak ditemukan rute yang sesuai
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = screenWidth < 1100;

    final currentRoute = Get.currentRoute; // Mendapatkan rute yang aktif
    final pageTitle = getActivePageName(currentRoute);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double baseFontSize = screenWidth < 600 ? 14 : 16;
            double titleFontSize = screenWidth < 600 ? 18 : 20;

            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menampilkan Icon menu hanya jika layar kecil
                  if (isSmallScreen) ...[
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
                  ],
                  if (isSmallScreen) ...[
                    // Gunakan Stack untuk menempatkan Text di tengah
                    Container(
                      margin: EdgeInsets.only(right: 0),
                      child: Text(
                        pageTitle, // Menampilkan nama halaman aktif
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  // Menampilkan teks "HOME" dan pastikan berada di tengah

                  // Menampilkan logo dan menu hanya pada layar besar
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
                  // Menampilkan menu navigasi hanya pada layar besar
                  if (!isSmallScreen) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildMenuItem("BERANDA", Routes.HOME),
                        _buildMenuItem("TENTANG", Routes.TENTANG),
                        _buildMenuItem("LAYANAN", Routes.LAYANAN),
                        _buildMenuItem("KARYAWAN", Routes.KARYAWAN),
                        _buildMenuItem("GALERI", Routes.GALERI),
                        // _buildMenuItem("SHOP", Routes.SHOP),
                        _buildMenuItem("MYLAYANAN", Routes.MYLAYANAN),
                      ],
                    ),
                  ],
                  // Menampilkan profil atau login tergantung status autentikasi
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
          onTap: () => Get.toNamed(route),
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
        Get.toNamed(Routes.PROFILE);
      },
      child: CircleAvatar(
        radius: 20, // Sesuaikan ukuran avatar
        backgroundImage: AssetImage(
          "assets/images/person.png",
        ),
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

class MyAppbarAdmin extends GetView<AuthController> {
  final AuthController authService = AuthController();

  // Fungsi untuk mendapatkan nama halaman berdasarkan rute
  String getActivePageName(String routeName) {
    switch (routeName) {
      case Routes.DASHBOARD_ADMIN:
        return 'Dashboard Admin';
      case Routes.ADMIN_LAYANAN:
        return 'Admin Layanan';
      case Routes.ADMIN_REPORT:
        return 'Admin Report';
      case Routes.ADMIN_TRANSAKSI:
        return 'Admin Transaksi';
      case Routes.MAIN:
        return 'Main';
      case Routes.LAYANAN:
        return 'Layanan';
      case Routes.PROFILE:
        return 'Profile';
      // Tambahkan kasus lainnya sesuai dengan rute yang ada
      default:
        return 'Admin Panel'; // Default jika tidak ditemukan rute yang sesuai
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = screenWidth < 1100;

    final currentRoute = Get.currentRoute; // Mendapatkan rute yang aktif
    final pageTitle = getActivePageName(currentRoute);

    return AppBar(
      backgroundColor: thirdColors,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: LayoutBuilder(
        builder: (context, constraints) {
          double baseFontSize = screenWidth < 600 ? 14 : 16;
          double titleFontSize = screenWidth < 600 ? 18 : 20;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: isSmallScreen
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                if (!isSmallScreen) ...[
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Get.offAllNamed(Routes.DASHBOARD_ADMIN),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 25,
                      ),
                    ),
                  ),
                ],
                if (!isSmallScreen) ...[
                  // Menu hanya ditampilkan pada layar besar
                  Row(
                    children: [
                      _buildMenuItem("DASHBOARD",
                          () => Get.toNamed(Routes.DASHBOARD_ADMIN)),
                      _buildMenuItem("ADD LAYANAN",
                          () => Get.toNamed(Routes.ADMIN_LAYANAN)),
                      _buildMenuItem("TRANSAKSI",
                          () => Get.toNamed(Routes.ADMIN_TRANSAKSI)),
                      _buildMenuItem(
                          "LAPORAN", () => Get.toNamed(Routes.ADMIN_REPORT)),
                      _buildMenuItem("LOGOUT", () {
                        // Memanggil logout hanya ketika item di-click
                        Get.find<AuthController>().logout();
                      }),
                    ],
                  ),
                ],
                if (isSmallScreen) ...[
                  // Gunakan Stack untuk menempatkan Text di tengah
                  Container(
                    margin: EdgeInsets.only(right: 60),
                    child: Text(
                      pageTitle, // Menampilkan nama halaman aktif
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  // Fungsi untuk membangun item menu
  Widget _buildMenuItem(String title, dynamic onTap) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 15), // Padding antar menu item
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
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
