import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';
import '../models/mahasiswa.dart';

class TambahMahasiswaView extends StatelessWidget {
  final MahasiswaController controller = Get.find();

  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController sexController = TextEditingController();

  TambahMahasiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Mahasiswa")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: npmController,
              decoration: const InputDecoration(labelText: "NPM"),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: telpController,
              decoration: const InputDecoration(labelText: "Telepon"),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),
            TextField(
              controller: tempatLahirController,
              decoration: const InputDecoration(labelText: "Tempat Lahir"),
            ),
            TextField(
              controller: tanggalLahirController,
              decoration:
                  const InputDecoration(labelText: "Tanggal Lahir (YYYY-MM-DD)"),
            ),
            TextField(
              controller: sexController,
              decoration: const InputDecoration(
                  labelText: "Jenis Kelamin (Laki-Laki / Perempuan)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final mahasiswa = Mahasiswa(
                  npm: npmController.text,
                  nama: namaController.text,
                  email: emailController.text,
                  telp: telpController.text,
                  tempatLahir: tempatLahirController.text,
                  tanggalLahir: tanggalLahirController.text,
                  sex: sexController.text,
                  alamat: alamatController.text,
                  photo: null,
                );
                await controller.addMahasiswa(mahasiswa);
                Get.back();
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}