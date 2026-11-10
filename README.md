# appakademik

Aplikasi Flutter praktikum Pemrograman Mobile (Pertemuan 1 sampai 4)
yang terhubung ke Web API Laravel (`mahasiswa-api`).

**Nama:** Salmaa Dzakirah Maharani
**NPM:** 2410010104
**Kelas:** 5B Non Reg Bjm TI

## Fitur

| Pertemuan | Isi |
|---|---|
| 1 | Daftar Mahasiswa dari API |
| 2 | Tambah dan Ubah Mahasiswa |
| 3 | Mata Kuliah (tampil, tambah, ubah, hapus) dan cetak PDF |
| 4 | Jadwal Kuliah, menu samping (drawer), dan cetak PDF Jadwal |

Menu samping (ikon di kiri atas halaman Home) berisi Mahasiswa,
Mata Kuliah, dan Jadwal Kuliah.

## Cara menjalankan

1. Jalankan Web API Laravel di port 8000: `php artisan serve`
2. Buka folder `appakademik`, lalu `flutter pub get`
3. Jalankan aplikasi (`flutter run`) di emulator atau Chrome

## Alamat API

Alamat API diatur otomatis di `lib/config.dart`:
- Chrome / web: `http://127.0.0.1:8000`
- Emulator Android: `http://10.0.2.2:8000`

Pastikan Web API Laravel berjalan di port 8000 (`php artisan serve`).

## Endpoint yang dipakai

- `/api/mahasiswa`
- `/api/mata-kuliah`
- `/api/jadwal`

## Catatan

- Kolom jenis kelamin pada form Tambah/Ubah Mahasiswa diisi
  `Laki-Laki` atau `Perempuan` (menyesuaikan database saya).
  Jika API memakai `L` atau `P`, isi sesuai itu.
- Foto Mahasiswa dan logo menu memakai gambar lokal di folder `assets`.
- Pengembangan dilakukan di laptop RAM 4 GB, sehingga diuji lewat
  Chrome tanpa emulator.
- Fitur cetak PDF memakai paket `pdf` dan `printing`. Di Windows,
  paket ini membutuhkan Developer Mode aktif.