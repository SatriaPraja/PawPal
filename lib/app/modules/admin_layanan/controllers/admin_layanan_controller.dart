import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/routes/app_pages.dart';

class AdminLayananController extends GetxController {
  final RxString selectedLayanan = ''.obs;
  final RxString selectedGender = ''.obs;
  TextEditingController petnameC = TextEditingController();
  TextEditingController pettypeC = TextEditingController();
  TextEditingController petgenderC = TextEditingController();
  TextEditingController ownernameC = TextEditingController();
  TextEditingController daysC = TextEditingController();
  @override
  void onClose() {
    petnameC.dispose();
    pettypeC.dispose();
    petgenderC.dispose();
    ownernameC.dispose();
    daysC.dispose();
    super.onClose();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fungsi untuk menghitung harga berdasarkan layanan
  final RxInt selectedDays = 1.obs; // Default jumlah hari

  int calculatePrice() {
    if (selectedLayanan.value == 'Perawatan Hewan') {
      return 200000;
    } else if (selectedLayanan.value == 'Konsultasi dan Vaksinasi') {
      return 150000;
    } else if (selectedLayanan.value == 'Penitipan Hewan') {
      return selectedDays.value * 50000; // Harga penitipan per hari
    }
    return 0; // Default harga
  }

  // Fungsi untuk menambahkan data beserta gambar
  Future<void> addData() async {
    try {
      // Mendapatkan ID pengguna yang sedang login
      String userId = FirebaseAuth.instance.currentUser!.uid;
      if (selectedLayanan.value.isEmpty ||
          selectedGender.value.isEmpty ||
          petnameC.text.isEmpty ||
          pettypeC.text.isEmpty ||
          ownernameC.text.isEmpty) {
        Get.snackbar('Error', 'Pastikan semua data telah terisi.');
        return;
      }
      // Mendapatkan dokumen dengan ID tertinggi
      QuerySnapshot querySnapshot = await firestore
          .collection('layanan')
          .orderBy('id', descending: true)
          .limit(1)
          .get();

      // Tentukan ID baru
      int newId = 1; // Default ID jika koleksi kosong
      if (querySnapshot.docs.isNotEmpty) {
        newId = querySnapshot.docs.first['id'] + 1;
      }

      String docId = newId.toString();
      DateTime checkInDate = DateTime.now();

      // Menambahkan data baru ke Firestore dengan status 'pending' dan checkOutDate null
      await firestore.collection('layanan').doc(docId).set({
        'id': newId,
        'layanan': selectedLayanan.value,
        'petName': petnameC.text,
        'petType': pettypeC.text,
        'petGender': selectedGender.value,
        'ownerName': ownernameC.text,
        'days': selectedDays.value,
        'price': calculatePrice(),
        'checkInDate': checkInDate.toIso8601String(),
        'checkOutDate': null, // Set null untuk checkout date
        'status': 'pending', // Set status default 'pending'
        'userId': userId, // Menyimpan ID pengguna yang menambahkan data
      });

      final authC = Get.put(AuthController(), permanent: true);

      if (authC.isAdminPersisted) {
        // Jika pengguna adalah admin
        Get.snackbar(
          'Success',
          'Data berhasil ditambahkan dengan ID $newId',
        );
      } else {
        // Jika pengguna bukan admin
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Berhasil menambahkan layanan',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back(); // Menutup dialog
              Get.toNamed(Routes.MYLAYANAN); // Navigasi ke Routes.MYLAYANAN
            },
            child: Text('OK'),
          ),
        );
      }

      // Reset form
      petnameC.clear();
      pettypeC.clear();
      petgenderC.clear();
      ownernameC.clear();
      daysC.clear();
      selectedLayanan.value = '';
      selectedGender.value = '';
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
      print('Error: $e');
    }
  }
}
