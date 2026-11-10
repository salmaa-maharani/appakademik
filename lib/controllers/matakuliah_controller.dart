import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/mata_kuliah.dart';
import '../config.dart';

class ApiService {
  final String baseUrl = '${ApiConfig.host}/api/mata-kuliah';

  Future<List<MataKuliah>> fetchMataKuliah() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MataKuliah.fromJson(data)).toList();
    } else {
      throw Exception('Gagal untuk load mata kuliah');
    }
  }

  Future<MataKuliah> createMataKuliah(MataKuliah mataKuliah) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: json.encode(mataKuliah.toJson()),
    );
    if (response.statusCode == 201) {
      return MataKuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal menyimpan data mata kuliah');
    }
  }

  Future<MataKuliah> updateMataKuliah(int id, MataKuliah mataKuliah) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: json.encode(mataKuliah.toJson()),
    );
    if (response.statusCode == 200) {
      return MataKuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal untuk update mata kuliah');
    }
  }

  Future<void> deleteMataKuliah(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode != 204) {
      throw Exception('Gagal untuk hapus mata kuliah');
    }
  }
}
