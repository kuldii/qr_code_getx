import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/controllers/auth_controller.dart';

import 'app/modules/loading/loading_screen.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController(), permanent: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // UNTUK AUTO LOGIN -> FIREBASE AUTHENTICATION
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapAuth) {
        if (snapAuth.connectionState == ConnectionState.waiting) return const LoadingScreen();
        return GetMaterialApp(
          title: "QR Code",
          initialRoute: snapAuth.hasData ? Routes.home : Routes.login,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
