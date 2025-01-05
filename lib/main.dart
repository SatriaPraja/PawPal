import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/app/modules/admin_layanan/controllers/admin_layanan_controller.dart';
import 'package:pawpal/loading.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (Firebase.apps.isEmpty && !kIsWeb) {
    await Firebase.initializeApp(
      name: "MyPawpalApp",
      options: FirebaseOptions(
        apiKey: "AIzaSyABMmgpxjLqMkpg3NzTp93StJvgIyVxZRc",
        projectId: "pawpal-c3e29",
        storageBucket: "pawpal-c3e29.appspot.com",
        messagingSenderId: "330826862730",
        appId: "1:330826862730:web:436af86603204d1a58dd73",
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyABMmgpxjLqMkpg3NzTp93StJvgIyVxZRc",
        projectId: "pawpal-c3e29",
        storageBucket: "pawpal-c3e29.appspot.com",
        messagingSenderId: "330826862730",
        appId: "1:330826862730:web:436af86603204d1a58dd73",
      ),
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Tentukan apakah pengguna sedang login
          final isLoggedIn = snapshot.data != null;
          final userUid = snapshot.data?.uid;

          // Tentukan apakah pengguna adalah admin
          final isAdmin = isLoggedIn && authC.isAdminPersisted;

          snapshot.data != null
              ? authC.isLoggedIn.value = true
              : authC.isLoggedIn.value = false;

          print("User UID: $userUid");

          // Perbarui isActive jika pengguna terdeteksi dan sudah login
          if (isLoggedIn && userUid != null) {
            _updateUserStatus(userUid, true); // Set isActive true jika login
          } else if (!isLoggedIn && userUid != null) {
            // Set isActive false jika logout
          }

          print(authC.isAdmin.value);
          print(authC.isAdminPersisted);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: isLoggedIn
                ? isAdmin
                    ? Routes.DASHBOARD_ADMIN
                    : Routes.HOME
                : Routes.MAIN,
            getPages: AppPages.routes,
          );
        }

        return LoadingView(); // Tampilkan loading jika stream belum siap
      },
    );
  }

  // Fungsi untuk memperbarui isActive di Firestore
  Future<void> _updateUserStatus(String uid, bool isActive) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'isActive': isActive});
      print("User status updated to $isActive");
    } catch (e) {
      print('Error updating isActive: $e');
    }
  }
}
