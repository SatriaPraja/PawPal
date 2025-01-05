import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminReportController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<String> _layanan = [
    'Perawatan Hewan',
    'Konsultasi dan Vaksinasi',
    'Penitipan Hewan'
  ];
  final List<String> _petgender = [
    'Jantan',
    'Betina',
  ];

  // Edit Data
  void editData(BuildContext context, String docId, Map<String, dynamic> data) {
    final RxString selectedLayanan = ''.obs;
    final TextEditingController layananC =
        TextEditingController(text: selectedLayanan.value);
    final TextEditingController daysC =
        TextEditingController(text: data['days'].toString());
    final TextEditingController petNameC =
        TextEditingController(text: data['petName']);
    final TextEditingController petTypeC =
        TextEditingController(text: data['petType']);
    final TextEditingController petGenderC =
        TextEditingController(text: data['petGender']);
    final TextEditingController ownerNameC =
        TextEditingController(text: data['ownerName']);
    final TextEditingController priceController = TextEditingController();

    var status = ''.obs;

    final RxInt selectedDays = 1.obs;
    final List<int> _days = List<int>.generate(30, (i) => i + 1);

    // Update harga
    int calculatePrice() {
      int price = 0;
      if (selectedLayanan.value == 'Perawatan Hewan') {
        price = 200000;
      } else if (selectedLayanan.value == 'Konsultasi dan Vaksinasi') {
        price = 150000;
      } else if (selectedLayanan.value == 'Penitipan Hewan') {
        price = selectedDays.value * 50000; // Harga penitipan per hari
      }

      // Update harga di controller
      priceController.text =
          price.toString(); // Update harga di TextEditingController
      return price;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Data'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    hint: selectedLayanan.value.isEmpty
                        ? Text("Pilih Layanan")
                        : Text(
                            selectedLayanan.value,
                          ),
                    isExpanded: true,
                    iconSize: 30.0,
                    items: _layanan.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      selectedLayanan.value = val!;
                      selectedDays.value = 1;
                      calculatePrice();
                    },
                  ),
                ),
              ),
              Obx(() {
                if (selectedLayanan.value == 'Penitipan Hewan') {
                  status.value = 'pending';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Jumlah Hari'),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: DropdownButton<int>(
                          underline: SizedBox(),
                          value: selectedDays.value,
                          isExpanded: true,
                          items: _days.map(
                            (day) {
                              return DropdownMenuItem<int>(
                                value: day,
                                child: Text(day.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            selectedDays.value = val!;
                            calculatePrice(); // Update harga
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  status.value = data['status'];
                }
                return SizedBox(); // Tidak tampil jika bukan Penitipan
              }),
              TextField(
                  controller: petNameC,
                  decoration: InputDecoration(labelText: 'Nama Hewan')),
              TextField(
                  controller: petTypeC,
                  decoration: InputDecoration(labelText: 'Jenis Hewan')),
              TextField(
                  controller: petGenderC,
                  decoration: InputDecoration(labelText: 'Gender Hewan')),
              TextField(
                  controller: ownerNameC,
                  decoration: InputDecoration(labelText: 'Nama Pemilik')),
              // Menampilkan harga yang ter-update
              Obx(() {
                calculatePrice();
                return TextField(
                  controller:
                      priceController, // Tampilkan harga yang sudah diperbarui
                  decoration: InputDecoration(labelText: 'Harga'),
                  enabled: false,
                );
              }),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (selectedLayanan.value.isEmpty ||
                  petNameC.text.isEmpty ||
                  petTypeC.text.isEmpty ||
                  petTypeC.text.isEmpty ||
                  ownerNameC.text.isEmpty) {
                Get.snackbar('Error', 'Pastikan semua data telah terisi.');
                return;
              } else {
                await firestore.collection('layanan').doc(docId).update({
                  'layanan': selectedLayanan.value,
                  'petName': petNameC.text,
                  'petType': petTypeC.text,
                  'petGender': petGenderC.text,
                  'ownerName': ownerNameC.text,
                  'days': selectedDays.value,
                  'price': priceController.text,
                  'status': status.value,
                });
                Navigator.pop(context);

                Get.snackbar('Success', 'Data berhasil diperbarui');
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  // Delete Data
  void deleteData(String docId) async {
    // Menampilkan dialog konfirmasi sebelum menghapus data
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: [
            // Tombol untuk membatalkan penghapusan
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog konfirmasi
              },
              child: Text('Batal'),
            ),
            // Tombol untuk mengonfirmasi penghapusan
            TextButton(
              onPressed: () async {
                try {
                  // Melakukan penghapusan data
                  await firestore.collection('layanan').doc(docId).delete();
                  Navigator.of(context)
                      .pop(); // Menutup dialog setelah penghapusan sukses
                  Get.snackbar('Success', 'Data berhasil dihapus');
                } catch (e) {
                  Navigator.of(context)
                      .pop(); // Menutup dialog jika terjadi kesalahan
                  Get.snackbar('Error', 'Terjadi kesalahan: $e');
                }
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
