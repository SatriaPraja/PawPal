import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/theme.dart';

class myDrawer extends StatelessWidget {
  final AuthController authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColors,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              Divider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildDrawerItem(
                      icon: Icons.home_outlined,
                      label: "Beranda",
                      route: Routes.HOME,
                    ),
                    _buildDrawerItem(
                      icon: Icons.info_outline,
                      label: "Tentang",
                      route: Routes.TENTANG,
                    ),
                    _buildDrawerItem(
                      icon: Icons.favorite_border_outlined,
                      label: "Layanan",
                      route: Routes.LAYANAN,
                    ),
                    _buildDrawerItem(
                      icon: Icons.people_outline,
                      label: "Karyawan",
                      route: Routes.KARYAWAN,
                    ),
                    _buildDrawerItem(
                      icon: Icons.photo_album_outlined,
                      label: "Galeri",
                      route: Routes.GALERI,
                    ),
                    // _buildDrawerItem(
                    //   icon: Icons.shopping_cart_outlined,
                    //   label: "Shop",
                    //   route: Routes.SHOP,
                    // ),
                    _buildDrawerItem(
                      icon: Icons.favorite_outlined,
                      label: "My Layanan",
                      route: Routes.MYLAYANAN,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Logout
          Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () => authC.Logout(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onTap: () => Get.toNamed(route),
    );
  }
}

class myDrawerAdmin extends StatelessWidget {
  final AuthController authC = AuthController();

  myDrawerAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian atas (Logo dan Menu)
          Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              Divider(),
              // Menu List
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildMenuItem(
                      icon: Icons.home_outlined,
                      title: "Dashboard",
                      onTap: () => Get.offAllNamed(Routes.DASHBOARD_ADMIN),
                    ),
                    buildMenuItem(
                      icon: Icons.shopping_cart_outlined,
                      title: "Tambah Layanan",
                      onTap: () => Get.toNamed(Routes.ADMIN_LAYANAN),
                    ),
                    buildMenuItem(
                      icon: Icons.favorite_border_outlined,
                      title: "Transaksi",
                      onTap: () => Get.toNamed(Routes.ADMIN_TRANSAKSI),
                    ),
                    buildMenuItem(
                      icon: Icons.person_4_outlined,
                      title: "Laporani",
                      onTap: () => Get.toNamed(Routes.ADMIN_REPORT),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Bagian bawah (Logout)
          Column(
            children: [
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: buildMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () => authC.Logout(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Fungsi untuk membangun item menu
  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onTap: onTap,
    );
  }
}

class MyDrawerAdmin extends StatelessWidget {
  final AuthController authC = AuthController();
  final String activeRoute;

  MyDrawerAdmin({Key? key, required this.activeRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: thirdColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian atas (Logo dan Menu)
          Column(
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              Divider(),
              // Menu List
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildMenuItem(
                      icon: Icons.home_outlined,
                      title: "Dashboard",
                      route: Routes.DASHBOARD_ADMIN,
                    ),
                    buildMenuItem(
                      icon: Icons.shopping_cart_outlined,
                      title: "Layanan",
                      route: Routes.ADMIN_LAYANAN,
                    ),
                    buildMenuItem(
                      icon: Icons.favorite_border_outlined,
                      title: "Transaksi",
                      route: Routes.ADMIN_TRANSAKSI,
                    ),
                    buildMenuItem(
                      icon: Icons.person_4_outlined,
                      title: "Laporan",
                      route: Routes.ADMIN_REPORT,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Bagian bawah (Logout)
          Column(
            children: [
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: buildMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                  route: "", // Tidak ada route untuk logout
                  onTap: () => authC.Logout(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Fungsi untuk membangun item menu
  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required String route,
    VoidCallback? onTap,
  }) {
    final isActive = route == activeRoute; // Periksa apakah item ini aktif

    return ListTile(
      tileColor: isActive
          ? primaryColors
          : Colors.transparent, // Gunakan warna thirdcolors di sini
      leading: Icon(
        icon,
        size: 30,
        color: isActive ? Colors.white : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: isActive ? Colors.white : Colors.black, fontSize: 20),
      ),
      onTap: () {
        if (onTap != null) {
          onTap();
        } else if (route.isNotEmpty) {
          Get.toNamed(route);
        }
      },
    );
  }
}
