// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controllers/bottom_nav_controller.dart';
// import 'package:pawpal/app/modules/home/views/home_view.dart';
// import 'package:pawpal/app/modules/shop/views/shop_view.dart';
// import 'package:pawpal/app/modules/profile/views/profile_view.dart';

// class MainPage extends StatelessWidget {
//   // Instansiasi BottomNavController
//   final BottomNavController bottomNavController = Get.put(BottomNavController());

//   // Daftar halaman untuk setiap tab
//   final List<Widget> pages = [
//     HomeView(),  // Halaman Home
//     ShopView(),  // Halaman Shop
//     ProfileView(),  // Halaman Profile
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() => pages[bottomNavController.currentIndex.value]), // Menampilkan halaman aktif berdasarkan indeks
//       bottomNavigationBar: Obx(
//         () => BottomNavigationBar(
//           currentIndex: bottomNavController.currentIndex.value,
//           onTap: (index) => bottomNavController.changeIndex(index),
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_bag),
//               label: "Shop",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "Profile",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }