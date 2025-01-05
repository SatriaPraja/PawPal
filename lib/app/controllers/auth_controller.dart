import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/routes/app_pages.dart';
import 'package:pawpal/app/widgets/splash.dart';
import 'package:pawpal/mainpage.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;
  var isLoading = false.obs;
  RxBool isAdmin = false.obs;
  final GetStorage storage = GetStorage();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool get isAdminPersisted => storage.read('isAdmin') ?? false;

  late String userUid = '';

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void checkAdminStatus(String email, String password) {
    // Validasi email dan password admin
    if (email == 'admin@gmail.com' && password == '123123') {
      isAdmin.value = true;
      storage.write('isAdmin', true); // Simpan status admin
    } else {
      isAdmin.value = false;
      storage.write('isAdmin', false); // Simpan status non-admin
    }
  }

  Future<void> updateIsActive(String docId) async {
    try {
      // Ambil data layanan dari Firestore
      var doc = await firestore.collection('users').doc(docId).get();

      if (doc.exists) {
        // Update checkout date dan status menjadi selesai
        await firestore.collection('users').doc(docId).update({
          'isActive': true,
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
      print('Error: $e');
    }
  }

  Future<UserCredential?> signInWithEmailPassword(
      String email, String password) async {
    // Validasi jika field kosong

    if (email.isEmpty || password.isEmpty) {
      // Tampilkan Snackbar
      Get.snackbar(
        'Error!',
        'Email dan password tidak boleh kosong.',
      );
      return null; // Hentikan proses
    }

    try {
      // Indikator loading diaktifkan
      isLoading.value = true;

      // Proses login menggunakan Firebase Authentication
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Indikator loading dimatikan
      isLoading.value = false;

      // Tandai bahwa pengguna sudah login

      // Cek status admin dengan email dan password
      checkAdminStatus(email, password);

      // Tampilkan Snackbar sukses
      if (isAdmin.isTrue) {
        Get.offAllNamed(Routes.DASHBOARD_ADMIN);
      } else {
        Get.offAllNamed(Routes.HOME);
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Indikator loading dimatikan jika terjadi error
      isLoading.value = false;

      // Penanganan error berdasarkan kode FirebaseAuth
      String message;
      if (e.code == 'user-not-found') {
        message = 'Pengguna tidak ditemukan. Periksa email Anda.';
      } else if (e.code == 'wrong-password') {
        message = 'Password salah. Silakan coba lagi.';
      } else {
        message = 'Login gagal: ${e.message}';
      }

      // Tampilkan Snackbar untuk error
      Get.snackbar(
        'Error!',
        message,
      );

      return null; // Gagal login
    } catch (e) {
      // Tangani error lainnya
      isLoading.value = false;

      // Tampilkan Snackbar untuk error umum
      Get.snackbar('Error!', 'Terjadi kesalahan: $e');

      return null;
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

  Future<UserCredential> signUpWithEmailPassword(
      String email, String password, String name) async {
    try {
      // Mendaftar pengguna baru
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mendapatkan referensi ke Firestore dan menyimpan data pengguna
      User? user = userCredential.user;
      if (user != null) {
        // Menyimpan nama pengguna ke Firestore
        await firestore.collection('users').doc(user.uid).set({
          'name': name, // Menyimpan nama pengguna
          'email': email, // Menyimpan email pengguna
          'createdAt': FieldValue.serverTimestamp(), // Timestamp pendaftaran
        });
      }
      isLoggedIn.value = true;

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  void logout() async {
    await FirebaseAuth.instance.signOut();

    Get.offAllNamed(Routes.HOME);
    FirebaseFirestore.instance.collection('users').doc('uid').update({
      'isActive': false,
    });
  }

  Future<void> Logout() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _updateUserStatus(
            user.uid, false); // Set isActive false saat logout
      }
      await FirebaseAuth.instance.signOut(); // Logout pengguna
      print('User logged out');
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  // Fungsi untuk memperbarui isActive di Firestore
  Future<void> _updateUserStatus(String uid, bool isActive) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'isActive': isActive});
      print("User status updated to $isActive");
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print('Error updating isActive: $e');
    }
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
