import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_view.dart';

void main() async {
  runApp(
    OverlaySupport(
      child: GetMaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
