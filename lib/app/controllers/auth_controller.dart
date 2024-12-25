import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/splash.dart';
import 'package:pawpal/mainpage.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;
  var isLoading = false.obs;
  RxBool isAdmin = false.obs;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      isLoggedIn.value = true;
      if (email == 'admin@gmail.com') {
        isAdmin.value = true;
      } else {
        isAdmin.value = false;
      }
      
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Future<void> login(String email, String pass) async {
  //   try {
  //     UserCredential myUser = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: pass,
  //     );
  //     print("Login success");
  //     Get.offAllNamed(Routes.HOME);
  //     // if (myUser.user!.emailVerified) {
  //     //   print("Email verified");
  //     //   Get.offAllNamed(Routes.HOME);
  //     // } else {
  //     //   print("Email not verified");
  //     //   Get.defaultDialog(
  //     //     title: "Verification Email",
  //     //     middleText:
  //     //         "Kamu perlu verifikasi terlebih dahulu. Apakah ingin verifikasi ulang?",
  //     //     onConfirm: () async {
  //     //       await myUser.user!.sendEmailVerification();
  //     //       Get.back();
  //     //     },
  //     //     textConfirm: "Ya",
  //     //     textCancel: "Tidak",
  //     //   );
  //     // }
  //   } on FirebaseAuthException catch (e) {
  //     print("FirebaseAuthException: ${e.code}");
  //     print("FirebaseAuthException Message: ${e.message}");
  //     if (e.code == 'user-not-found') {
  //       Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText: "User tidak ditemukan",
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText: "Password salah!",
  //       );
  //     } else {
  //       Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText: "Email atau password salah!",
  //       );
  //     }
  //   } catch (e) {
  //     print("General exception: $e");
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Akun tidak ada",
  //     );
  //   }
  // }
  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // firestore.collection("Users").doc(userCredential.user!.uid).set({
      //   'uid': userCredential.user!.uid,
      //   'email': email,
      // ,});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  void logout() async {
    await FirebaseAuth.instance.signOut();

    Get.offAllNamed(Routes.HOME);
  }

  // void signup(String email, String pass) async {
  //   try {
  //     UserCredential myUser = await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: pass,
  //     );
  //     // send email verifikasi
  //     await myUser.user!.sendEmailVerification();

  //     Get.defaultDialog(
  //       title: "Verification Email",
  //       middleText: "Kami sudah mengirim email verifikasi ke $email",
  //       onConfirm: () {
  //         Get.back();
  //         Get.back();
  //       },
  //       textConfirm: "Ya",
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('weak-password');
  //       Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText: "weak password!",
  //       );
  //     } else if (e.code == 'email-already-in-use') {
  //       print('Akun sudah digunakan');
  //       Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText: "Akun sudah digunakan",
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Tidak dapat mendaftarkan akun ini",
  //     );
  //   }
  // }

  // void logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   Get.offAllNamed(Routes.LOGIN);
  // }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Kami telah mengirimkan reset password ke $email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Tidak dapat mengirimkan email",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Email tidak valid",
      );
    }
  }

  void navigateBasedOnAuthStatus() {
    // Periksa apakah aplikasi berjalan di web
    if (kIsWeb) {
      // Langsung arahkan ke Home tanpa memeriksa status login
      Get.offAllNamed(Routes.HOME);
    } else {
      // Jika platform bukan web (Android atau iOS), periksa status login
      auth.authStateChanges().listen(
        (User? user) {
          if (user == null) {
            // Jika user null (belum login), arahkan ke halaman Login
            Get.to(MySplashScreen());
          } else {
            // Jika user tidak null (sudah login), arahkan ke halaman MainPage
            Get.offAll(() => MainPage());
          }
        },
      );
    }
  }
}
