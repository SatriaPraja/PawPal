import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';

class ShopController extends GetxController {
  var selectedCategory = "Semua".obs;
    
  // Fungsi untuk mengubah kategori yang dipilih
  void selectCategory(String category) {
    selectedCategory.value = category;
  }
  
  var isHovered = false.obs;

  void onHover(bool hovering) {
    isHovered.value = hovering;
  }

}
