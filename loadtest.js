import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '10s', target: 200 }, // Naik bertahap ke 200 user dalam 10 detik
    { duration: '20s', target: 200 }, // Tahan 200 user aktif selama 20 detik
    { duration: '5s', target: 0 },    // Turun perlahan
  ],
};

export default function () {
  // 1. Buka halaman depan (dengan jar cookie otomatis tersimpan)
  const res1 = http.get('http://localhost:3030/');
  check(res1, {
    'Beranda status 200': (r) => r.status === 200,
  });
  
  sleep(1); // Siswa baca-baca beranda 1 detik
  
  // 2. Klik tombol Login (Sekarang Moodle akan memuat full halaman login karena cookie sudah ada)
  const res2 = http.get('http://localhost:3030/login/index.php');
  check(res2, {
    'Halaman Login dimuat penuh': (r) => r.status === 200 && r.body.includes('Selamat datang di Moodle'),
  });

  sleep(2); // Siswa diam 2 detik untuk mengetik username/password
}
