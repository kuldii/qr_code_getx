import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // untuk cek kondisi ada auth atau tidak -> uid
  //  Null -> tidak ada user yang sedang login
  // uid -> ada user yang sedang login
  String? uid;

  late FirebaseAuth auth;

  Future<Map<String, dynamic>> login(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);

      return {
        "error": false,
        "message": "Berhasil login.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    } catch (e) {
      // Error general
      return {
        "error": true,
        "message": "Tidak dapat login.",
      };
    }
  }

  Future<Map<String, dynamic>> logout() async {
    try {
      await auth.signOut();

      return {
        "error": false,
        "message": "Berhasil logout.",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    } catch (e) {
      // Error general
      return {
        "error": true,
        "message": "Tidak dapat logout.",
      };
    }
  }

  @override
  void onInit() {
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((event) {
      uid = event?.uid;
    });

    super.onInit();
  }
}
