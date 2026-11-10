import 'package:flutter/material.dart';
import 'mahasiswa_view01.dart';
import 'matakuliah_view.dart';
import 'jadwal_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo_uniska.png',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 90,
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Admin',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.emoji_people_rounded),
              title: const Text('Mahasiswa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MahasiswaView()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_sharp),
              title: const Text('Mata Kuliah'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MatakuliahView()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Jadwal Kuliah'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JadwalPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'PRAKTIKUM MOBILE SEMESTER 7/8',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}