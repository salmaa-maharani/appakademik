import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';
import '../models/mahasiswa.dart';

class EditMahasiswaView extends StatefulWidget {
  final Mahasiswa mahasiswa;

  const EditMahasiswaView({super.key, required this.mahasiswa});

  @override
  State<EditMahasiswaView> createState() => _EditMahasiswaViewState();
}

class _EditMahasiswaViewState extends State<EditMahasiswaView> {
  final MahasiswaController controller = Get.find();

  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController sexController = TextEditingController();

  @override
  void initState() {
    super.initState();
    npmController.text = widget.mahasiswa.npm;
    namaController.text = widget.mahasiswa.nama;
    emailController.text = widget.mahasiswa.email;
    telpController.text = widget.mahasiswa.telp;
    alamatController.text = widget.mahasiswa.alamat;
    tempatLahirController.text = widget.mahasiswa.tempatLahir;
    tanggalLahirController.text = widget.mahasiswa.tanggalLahir;
    sexController.text = widget.mahasiswa.sex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                decoration: const InputDecoration(
                    labelText: "Tanggal Lahir (YYYY-MM-DD)"),
              ),
              TextField(
                controller: sexController,
                decoration: const InputDecoration(
                    labelText: "Jenis Kelamin (Laki-Laki / Perempuan)"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final updatedMahasiswa = Mahasiswa(
                    id: widget.mahasiswa.id,
                    npm: npmController.text,
                    nama: namaController.text,
                    email: emailController.text,
                    telp: telpController.text,
                    alamat: alamatController.text,
                    tempatLahir: tempatLahirController.text,
                    tanggalLahir: tanggalLahirController.text,
                    sex: sexController.text,
                    photo: widget.mahasiswa.photo,
                  );
                  await controller.updateMahasiswa(
                      widget.mahasiswa.id!, updatedMahasiswa);
                  Get.back();
                },
                child: const Text("Simpan Perubahan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}