import 'package:get/get.dart';

import '../controllers/admin_layanan_controller.dart';

class AdminLayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLayananController>(
      () => AdminLayananController(),
    );
  }
}
