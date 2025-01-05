import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardAdminController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();

  var totalUsers = 0.obs;
  var activeUsers = 0.obs;
  var totalLayanan = 0.obs;

  @override
  void onInit() {
    super.onInit();
    
    _listenToUsers();
    _listenToLayanan();
  }
  

  void _listenToUsers() {
    _firestoreService.fetchUsers().listen((userData) {
      final users = userData.map((e) => UserModel.fromJson(e)).toList();
      totalUsers.value = users.length;
      activeUsers.value = users.where((user) => user.isActive).length;
    });
  }

  void _listenToLayanan() {
    _firestoreService.fetchLayanan().listen((layananDocs) {
      final layananList = layananDocs
          .map((doc) =>
              LayananModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
      totalLayanan.value = layananList.length;
    });
  }
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> fetchUsers() {
    return _db
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Stream<List<DocumentSnapshot>> fetchLayanan() {
    return _db
        .collection('layanan')
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }
}

class LayananModel {
  final String id;
  final String serviceName;
  final String userId;
  final DateTime checkInDate;

  LayananModel({
    required this.id,
    required this.serviceName,
    required this.userId,
    required this.checkInDate,
  });

  factory LayananModel.fromJson(Map<String, dynamic> json, String id) {
    return LayananModel(
      id: id,
      serviceName: json['layanan']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      checkInDate: json['checkInDate'] == null
          ? DateTime.now() // Default jika null
          : (json['checkInDate'] is Timestamp
              ? (json['checkInDate'] as Timestamp).toDate()
              : DateTime.parse(json['checkInDate'])),
    );
  }
}

class UserModel {
  final String id;
  final bool isActive;

  UserModel({required this.id, required this.isActive});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      isActive: json['isActive'] == true,
    );
  }
}
