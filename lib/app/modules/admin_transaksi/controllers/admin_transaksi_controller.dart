import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminTransaksiController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateCheckoutDate(String docId) async {
    try {
      // Ambil data layanan dari Firestore
      var doc = await firestore.collection('layanan').doc(docId).get();

      if (doc.exists) {
        DateTime checkOutDate = DateTime.now();

        // Update checkout date dan status menjadi selesai
        await firestore.collection('layanan').doc(docId).update({
          'checkOutDate': checkOutDate.toIso8601String(), // Perbaiki sini
          'status': 'selesai',
        });

        // Menampilkan snackbar setelah berhasil update
        Get.snackbar(
            'Success', 'Checkout date telah diubah dan status menjadi selesai');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
      print('Error: $e');
    }
  }
}
