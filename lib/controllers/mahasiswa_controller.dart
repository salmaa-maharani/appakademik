import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../models/mahasiswa.dart';
import '../config.dart';

class MahasiswaController extends GetxController {
  var mahasiswaList = <Mahasiswa>[].obs;

  // untuk Flutter di Chrome
  final String apiUrl = '${ApiConfig.host}/api/mahasiswa';

  @override
  void onInit() {
    super.onInit();
    tangkapDataMahasiswa();
  }

  Future<void> tangkapDataMahasiswa() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      mahasiswaList.value = data
          .map((item) => Mahasiswa.fromJson(item))
          .toList();
    } else {
      throw Exception('Gagal Ambil Data mahasiswa');
    }
  }

  Future<void> addMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(mahasiswa.toJson()),
    );
    if (response.statusCode == 201) {
      mahasiswaList.add(Mahasiswa.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Gagal Simpan Data mahasiswa');
    }
  }

  Future<void> updateMahasiswa(int id, Mahasiswa mahasiswa) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(mahasiswa.toJson()),
    );
    if (response.statusCode == 200) {
      final index = mahasiswaList.indexWhere((m) => m.id == id);
      if (index != -1) {
        mahasiswaList[index] = Mahasiswa.fromJson(json.decode(response.body));
      }
    } else {
      throw Exception('Gagal Ubah Data mahasiswa');
    }
  }

  Future<void> deleteMahasiswa(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$id'),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 204) {
      mahasiswaList.removeWhere((m) => m.id == id);
    } else {
      throw Exception('Gagal Hapus Data mahasiswa');
    }
  }
}
