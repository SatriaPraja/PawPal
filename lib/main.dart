import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawpal/app/controllers/auth_controller.dart';
import 'package:pawpal/loading.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
    // Inisialisasi Firebase untuk Web
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyABMmgpxjLqMkpg3NzTp93StJvgIyVxZRc",
        projectId: "pawpal-c3e29",
        storageBucket: "pawpal-c3e29.appspot.com",
        messagingSenderId: "330826862730",
        appId: "1:330826862730:web:436af86603204d1a58dd73",
      ),
    );
  } else {
    // Inisialisasi Firebase untuk Android/iOS
    await Firebase.initializeApp(
      name: "Pawpal",
      options: const FirebaseOptions(
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
          WidgetsBinding.instance.addPostFrameCallback((_) {
            authC.navigateBasedOnAuthStatus(); // Pindahkan pemanggilan di sini
          });
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.MAIN,
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      },
    );
  }
}

