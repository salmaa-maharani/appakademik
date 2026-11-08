import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/matakuliah_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Akademik',
      home: const MatakuliahView(),
    );
  }
}