import 'package:get/get.dart';

import '../controllers/admin_transaksi_controller.dart';

class AdminTransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminTransaksiController>(
      () => AdminTransaksiController(),
    );
  }
}
