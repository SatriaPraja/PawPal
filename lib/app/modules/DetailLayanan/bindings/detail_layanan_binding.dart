import 'package:get/get.dart';

import '../controllers/detail_layanan_controller.dart';

class DetailLayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLayananController>(
      () => DetailLayananController(),
    );
  }
}
