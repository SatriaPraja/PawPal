import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../mainpage.dart';
import '../modules/Dashboard_Admin/bindings/dashboard_admin_binding.dart';
import '../modules/Dashboard_Admin/views/dashboard_admin_view.dart';
import '../modules/DetailLayanan/bindings/detail_layanan_binding.dart';
import '../modules/DetailLayanan/views/detail_layanan_view.dart';
import '../modules/admin_layanan/bindings/admin_layanan_binding.dart';
import '../modules/admin_layanan/views/admin_layanan_view.dart';
import '../modules/admin_report/bindings/admin_report_binding.dart';
import '../modules/admin_report/views/admin_report_view.dart';
import '../modules/admin_transaksi/bindings/admin_transaksi_binding.dart';
import '../modules/admin_transaksi/views/admin_transaksi_view.dart';
import '../modules/galeri/bindings/galeri_binding.dart';
import '../modules/galeri/views/galeri_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/karyawan/bindings/karyawan_binding.dart';
import '../modules/karyawan/views/karyawan_view.dart';
import '../modules/layanan/bindings/layanan_binding.dart';
import '../modules/layanan/views/layanan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mylayanan/bindings/mylayanan_binding.dart';
import '../modules/mylayanan/views/mylayanan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/tentang/bindings/tentang_binding.dart';
import '../modules/tentang/views/tentang_view.dart';
import '../widgets/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => kIsWeb ? HomeView() : MySplashScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => kIsWeb ? HomeView() : MainPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => kIsWeb ? LoginViewWeb() : LoginViewApp(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      // page: () => RegisterViewApp(),
      page: () => kIsWeb ? RegisterViewWeb() : RegisterViewApp(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => const TentangView(),
      binding: TentangBinding(),
    ),
    GetPage(
      name: _Paths.LAYANAN,
      page: () => LayananView(),
      binding: LayananBinding(),
    ),
    GetPage(
      name: _Paths.KARYAWAN,
      page: () => const KaryawanView(),
      binding: KaryawanBinding(),
    ),
    GetPage(
      name: _Paths.GALERI,
      page: () => const GaleriView(),
      binding: GaleriBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAYANAN,
      page: () => DetailLayananView(
        title: Get.parameters['title'] ?? 'Detail',
        description: Get.parameters['desc'] ?? 'Description not available',
      ),
      binding: DetailLayananBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_ADMIN,
      page: () => DashboardAdminView(),
      binding: DashboardAdminBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LAYANAN,
      page: () => AdminLayananView(),
      binding: AdminLayananBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_REPORT,
      page: () => AdminReportView(),
      binding: AdminReportBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_TRANSAKSI,
      page: () => const AdminTransaksiView(),
      binding: AdminTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.MYLAYANAN,
      page: () => const MylayananView(),
      binding: MylayananBinding(),
    ),
  ];
}
