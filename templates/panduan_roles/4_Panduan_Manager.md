# 🏢 Panduan Moodle untuk MANAGER / ADMIN

Manager memiliki hak akses tertinggi kedua setelah Admin server. Bertugas mengelola data skala besar seperti User, Kohort (Kelas), dan Laporan.

## 1. Manajemen User dan Kohort (Kelas)
Kohort (Cohort) adalah pengelompokan siswa berdasarkan kelas nyata (Misal: X TKJ 1).
- **Membuat Kohort**: Administrasi Situs -> Pengguna -> Akun -> Kohort. Klik *Tambah kohort baru*.
- **Menambah Anggota ke Kohort**: Di halaman Kohort, klik ikon gambar orang (Assign). Pilih nama siswa dari kanan dan pindahkan ke kiri.

## 2. Import User Massal via CSV
1. Siapkan file CSV dengan kolom minimal: `username, password, firstname, lastname, email, cohort1`.
2. Buka **Administrasi Situs** -> **Pengguna** -> **Unggah Pengguna** (Upload users).
3. Masukkan file CSV. Pisahkan dengan Koma (,).
4. Di halaman pratinjau, pada bagian *Upload type*, pilih "Add new only, skip existing".
5. Pada bagian *New user password*, pilih "Field required in file".
6. Klik **Unggah pengguna**. Semua siswa otomatis masuk ke sistem dan masuk ke kelasnya (kohort).

## 3. Enroll Siswa Massal ke Kursus (Cohort Sync)
Agar satu kelas (kohort) langsung masuk ke mata pelajaran tertentu:
1. Masuk ke mata pelajaran (Kursus).
2. Klik tab **Peserta** (Participants).
3. Klik menu dropdown/gear di kiri atas halaman peserta, pilih **Metode Pendaftaran** (Enrollment methods).
4. Tambahkan metode: **Sinkronisasi Kohort** (Cohort sync).
5. Pilih kohort kelas yang sesuai (Misal: X TKJ 1) dan set peran ke **Siswa** (Student).
6. Klik Tambah. Seluruh siswa di kelas tersebut otomatis masuk ke kursus.

## 4. Mengubah Desain / Tema (Moove)
1. Buka **Administrasi Situs** -> **Penampilan** (Appearance) -> **Tema** -> **Moove**.
2. Anda bisa mengubah Logo, Banner, Kontak Footer, dan menyuntikkan kode CSS (Raw SCSS).
3. Jika Anda mengubah desain, jangan lupa ke Administrasi Situs -> Pengembangan -> **Bersihkan semua cache** (Purge caches) agar perubahan langsung terlihat di semua pengguna.

## 5. Melihat Laporan Aktivitas
1. Administrasi Situs -> **Laporan** (Reports).
2. Anda bisa melihat log akses (Log), siapa yang sedang login (Live logs), dan kinerja server.
