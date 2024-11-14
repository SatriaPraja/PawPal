import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/splash.dart';
import 'package:pawpal/mainpage.dart';

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
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/tentang/bindings/tentang_binding.dart';
import '../modules/tentang/views/tentang_view.dart';

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
  ];
}
