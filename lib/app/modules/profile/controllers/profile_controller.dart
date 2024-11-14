import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var isSwitchedOn1 = false.obs;
  var isSwitchedOn2 = false.obs;


  // Method untuk mengubah status switch
  void toggleSwitch1(bool value) {
    isSwitchedOn1.value = value;
  }
  void toggleSwitch2(bool value) {
    isSwitchedOn2.value = value;
  }

  
}
