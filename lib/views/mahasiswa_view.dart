import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends StatelessWidget {
  MahasiswaView({super.key});

  final MahasiswaController controller = Get.put(MahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.mahasiswaList.isEmpty) {
                return const Center(child: Text("Tidak ada data mahasiswa"));
              }
              return ListView.builder(
                itemCount: controller.mahasiswaList.length,
                itemBuilder: (context, index) {
                  final mahasiswa = controller.mahasiswaList[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mahasiswa.nama,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Text("NPM: ${mahasiswa.npm}"),
                          Text("Email: ${mahasiswa.email}"),
                          Text("Tempat Lahir: ${mahasiswa.tempatLahir}"),
                          Text("Tanggal Lahir: ${mahasiswa.tanggalLahir}"),
                          Text("Jenis Kelamin: ${mahasiswa.sex}"),
                          const SizedBox(height: 10),
                          OverflowBar(
                            alignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Hapus'),
                                onPressed: () {
                                  controller.deleteMahasiswa(mahasiswa.id!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}