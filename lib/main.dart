import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_view.dart';
import 'package:api/views/signin_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    OverlaySupport(
      child: GetMaterialApp(
        home: FirebaseAuth.instance.currentUser == null ? SigninView() : HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
