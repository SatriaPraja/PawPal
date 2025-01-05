import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/theme.dart';

import '../controllers/admin_transaksi_controller.dart';

class AdminTransaksiView extends GetView<AdminTransaksiController> {
  const AdminTransaksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = context.width;
    final isSmallScreen = ScreenWidth < 1100;

    return Scaffold(
      appBar: isSmallScreen
          ? PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SafeArea(child: MyAppbarAdmin()),
            )
          : null,
      drawer: isSmallScreen
          ? MyDrawerAdmin(
              activeRoute: ModalRoute.of(context)?.settings.name ?? "")
          : null,
      body: Row(
        children: [
          if (!isSmallScreen)
            SizedBox(
              width: 300,
              child: MyDrawerAdmin(
                  activeRoute: ModalRoute.of(context)?.settings.name ?? ""),
            ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.firestore
                  .collection('layanan')
                  .orderBy('id')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('Tidak ada data'));
                }

                var data = snapshot.data!.docs;

                for (var doc in data) {
                  var docData = doc.data() as Map<String, dynamic>;
                  if (doc.id.isEmpty ||
                      docData['id'] == null ||
                      docData['id'] == '') {
                    // Jika docId kosong atau tidak valid, tampilkan snackbar
                    Future.delayed(Duration.zero, () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('DocId tidak valid atau kosong'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                    break; // Keluar dari loop setelah menampilkan snackbar
                  }
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: context.width,
                        margin: EdgeInsets.symmetric(
                            vertical: isSmallScreen ? 0 : 30,
                            horizontal: isSmallScreen ? 0 : 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                            // Report Title
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Laporan Transaksi",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10),

                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 20,
                                  border: TableBorder.all(
                                      color: Colors.grey, width: 0.5),
                                  headingRowColor:
                                      WidgetStateProperty.all(Colors.black),
                                  headingRowHeight: 50,
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'ID',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Pet Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Check-in Date',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Checkout Date',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Price',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Action',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: [
                                    ...data.where((doc) {
                                      final data =
                                          doc.data() as Map<String, dynamic>?;
                                      return data != null &&
                                          data.containsKey('checkInDate');
                                    }).map<DataRow>((doc) {
                                      final data =
                                          doc.data() as Map<String, dynamic>;
                                      DateTime checkInDate =
                                          DateTime.parse(data['checkInDate']);
                                      DateTime? checkOutDate = data.containsKey(
                                                  'checkOutDate') &&
                                              data['checkOutDate'] != null
                                          ? DateTime.parse(data['checkOutDate'])
                                          : null;
                                      double price = double.tryParse(
                                              data['price'].toString()) ??
                                          0;

                                      return DataRow(cells: [
                                        DataCell(
                                            Text(data['id'].toString())), // ID
                                        DataCell(
                                            Text(data['petName'])), // Pet Name
                                        DataCell(Text(checkInDate
                                            .toString())), // Check-in Date
                                        DataCell(Text(checkOutDate
                                                ?.toString() ??
                                            'Belum Checkout')), // Check-out Date
                                        DataCell(
                                            Text(price.toString())), // Price
                                        DataCell(
                                            Text(data['status'])), // Status
                                        DataCell(
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColors,
                                            ),
                                            onPressed: data['status'] ==
                                                    'pending'
                                                ? () => controller
                                                    .updateCheckoutDate(doc.id)
                                                : null,
                                            child: Text('Checkout',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ]);
                                    }).toList(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
