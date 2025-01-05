import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';

class HomeController extends GetxController {
  // Gunakan RxInt agar state bisa dipantau
  var currentIndex = 0.obs;

  // Fungsi untuk mengubah index dan menavigasi halaman
  void changeIndex(int index) {
    currentIndex.value = index; // Update index untuk tampilan
    // Panggil fungsi navigasi
  }

  // Fungsi navigasi berdasarkan index
}
