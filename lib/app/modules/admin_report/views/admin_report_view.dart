import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import 'package:pawpal/app/widgets/part/drawer.dart';
import 'package:pawpal/app/widgets/part/primaributton.dart';
import 'package:pawpal/theme.dart';
import '../controllers/admin_report_controller.dart';

class AdminReportView extends GetView<AdminReportController> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
              stream: firestore.collection('layanan').orderBy('id').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('Tidak ada data'));
                }

                final docs = snapshot.data!.docs;

                

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
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Laporan PawPal",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
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
                                      'Layanan',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Nama Hewan',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Jenis Hewan',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Nama Pemilik',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'CheckInDate',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'CheckOutDate',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Harga',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Hari',
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
                                      'Aksi',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: docs.map((doc) {
                                  final data =
                                      doc.data() as Map<String, dynamic>;

                                  return DataRow(cells: [
                                    DataCell(Text(data['id'].toString())),
                                    DataCell(Text(data['layanan'])),
                                    DataCell(Text(data['petName'])),
                                    DataCell(Text(data['petType'])),
                                    DataCell(Text(data['petGender'])),
                                    DataCell(Text(data['ownerName'])),
                                    DataCell(Text(data['checkInDate'])),
                                    DataCell(
                                        Text(data['checkOutDate'].toString())),
                                    DataCell(Text(data['price'].toString())),
                                    DataCell(Text(data['days'].toString())),
                                    DataCell(Text(data['status'])),
                                    DataCell(
                                      Row(
                                        children: [
                                          // Tombol Edit (Hijau)
                                          IconButton(
                                            icon: Icon(
                                                Icons.edit), // Ikon untuk Edit
                                            color: Colors.green, // Warna hijau
                                            onPressed: () =>
                                                controller.editData(
                                                    context, doc.id, data),
                                          ),
                                          // Tombol Hapus (Merah)
                                          IconButton(
                                            icon: Icon(Icons
                                                .delete), // Ikon untuk Hapus
                                            color: Colors.red, // Warna merah
                                            onPressed: () =>
                                                controller.deleteData(doc.id),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]);
                                }).toList(),
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
