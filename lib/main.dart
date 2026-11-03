import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/mahasiswa_view01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Akademik',
      home: MahasiswaView(),
    );
  }
}