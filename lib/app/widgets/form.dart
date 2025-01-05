import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/modules/admin_layanan/controllers/admin_layanan_controller.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
import 'package:pawpal/theme.dart';

class MyForm extends GetView<AdminLayananController> {
  final List<String> _layanan = [
    'Perawatan Hewan',
    'Konsultasi dan Vaksinasi',
    'Penitipan Hewan'
  ];
  final List<String> _petgender = [
    'Jantan',
    'Betina',
  ];

  final List<int> _days = List<int>.generate(30, (i) => i + 1); // Dropdown 1-30

  final authC = Get.put(AuthController(), permanent: true);

  final FocusNode petNameFocusNode = FocusNode();
  final FocusNode petTypeFocusNode = FocusNode();
  final FocusNode ownerNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;

    // Kondisi apakah lebar layar kurang dari 1100
    final isSmallScreen = screenWidth < 1100;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        padding: EdgeInsets.all(20),
        width: context.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Layanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Jenis Layanan'),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  hint: controller.selectedLayanan.value.isEmpty
                      ? Text('Pilih Layanan')
                      : Text(
                          controller.selectedLayanan.value,
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
                    controller.selectedLayanan.value = val!;
                    controller.selectedDays.value = 1; // Reset pilihan hari
                    controller.calculatePrice(); // Update harga
                  },
                ),
              ),
            ),

            // Dropdown jumlah hari jika Penitipan hewan
            Obx(
              () {
                if (controller.selectedLayanan.value == 'Penitipan Hewan') {
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
                          value: controller.selectedDays.value,
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
                            controller.selectedDays.value = val!;
                            controller.calculatePrice(); // Update harga
                          },
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(); // Tidak tampil jika bukan Penitipan
              },
            ),
            SizedBox(height: 10),
            Text('Nama Hewan'),
            Container(
              width: context.width,
              child: TextField(
                focusNode: petNameFocusNode,
                textCapitalization: TextCapitalization.sentences,
                controller: controller.petnameC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Jenis Hewan'),
            Container(
              width: context.width,
              child: TextField(
                focusNode: petTypeFocusNode,
                textCapitalization: TextCapitalization.sentences,
                controller: controller.pettypeC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Jenis Kelamin'),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  hint: controller.selectedGender.value.isEmpty
                      ? Text('Pilih Jenis Kelamin')
                      : Text(
                          controller.selectedGender.value,
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  items: _petgender.map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    controller.selectedGender.value = val!;
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Nama Pemilik'),
            Container(
              width: context.width,
              child: TextField(
                focusNode: ownerNameFocusNode,
                textCapitalization: TextCapitalization.sentences,
                controller: controller.ownernameC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Menampilkan harga untuk layanan lainnya

            Obx(
              () {
                if (controller.selectedLayanan.value != 'Penitipan Hewan') {
                  int price = controller.calculatePrice();
                  if (price > 0) {
                    return Text(
                      'Total Harga: Rp $price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    );
                  }
                } else {
                  int price = controller.calculatePrice();
                  return Text(
                    'Total Harga: Rp $price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  );
                }
                return SizedBox(); // Tidak tampil jika harga 0
              },
            ),
            SizedBox(height: 20),
            MyPButton(
              color: primaryColors,
              text: authC.isAdminPersisted
                  ? 'Tambah Data Layanan'
                  : 'Pesan Layanan',
              textcolor: Colors.white,
              onpress: () {
                controller.addData();
              },
            )
          ],
        ),
      ),
    );
  }
}
