import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '20s', target: 200 }, // Naik cepat ke 200 user
    { duration: '20s', target: 500 }, // Naik lagi ke 500 user
    { duration: '20s', target: 800 }, // Puncak siksaan 800 user!
    { duration: '10s', target: 0 },   // Turun
  ],
};

export default function () {
  const res = http.get('http://localhost:3030/login/index.php');
  check(res, {
    'Sukses 200': (r) => r.status === 200 || r.status === 303,
  });
  // Jeda hanya 1 detik sebelum refresh ulang (Sangat Brutal)
  sleep(1); 
}
