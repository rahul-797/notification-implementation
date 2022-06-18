import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_view.dart';

void main() async {
  runApp(
    GetMaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
