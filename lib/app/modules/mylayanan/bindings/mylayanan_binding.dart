import 'package:get/get.dart';

import '../controllers/mylayanan_controller.dart';

class MylayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MylayananController>(
      () => MylayananController(),
    );
  }
}
