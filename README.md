# Powerpuff Bank
### UTS_DasPro_Power-Puff_A
> Program ini adalah program simulasi sistem ATM sederhana berbasis CLI (Command Line Interface) yang dicompile menggunakan bahasa **Pascal**. Proyek ini dibuat untuk memenuhi tugas praktikum dasar pemrograman di Universitas Sumatera Utara, program studi S-1 Ilmu Komputer. Proyek ini menerapkan materi-materi inti seperti ````while````, ````repeat until````, dan ````case of````.
## Anggota Kelompok
| Nama | NIM | Lab |
| --- | --- | --- |
| Tata Augusthy Panjaitan | 261401087 | Lab 2 |
| Zahra Nazla Annisa Effendi | 261401134 | Lab 2 |
| Ahmad Zidan Mubarak | 261401068 | Lab 1 |

## Penjelasan
Program Simulasi ATM (Powerpuff Bank) dirancang untuk mensimulasikan alur kerja transaksi ATM secara interaktif melalui terminal/CLI. Berikut adalah rincian fitur dan logika pemrograman yang diterapkan:

### 1. Autentikasi & Keamanan (Login PIN)
- **Inisialisasi Data**: Program menetapkan PIN *default* (`123456`) dan saldo awal sebesar **Rp 1.000.000,00**.
- **Sistem Login (`while-do`)**: Pengguna diminta memasukkan PIN sebelum dapat mengakses menu utama.
- **Batas Percobaan & Pemblokiran**: Pengguna memiliki maksimal **3 kali kesempatan** percobaan. Jika salah memasukkan PIN sebanyak 3 kali, sistem akan memblokir akses dan menghentikan program.

### 2. Menu Utama Interaktif (`repeat-until`)
Setelah berhasil login, pengguna akan masuk ke menu transaksi utama. Menu ini akan terus ditampilkan secara berulang menggunakan struktur `repeat-until` sampai pengguna memilih opsi keluar.

### 3. Fitur Transaksi (`case-of`)
Pemilihan menu diproses menggunakan struktur kondisional `case-of`:
* **1. Cek Saldo**: Menampilkan saldo terkini pengguna.
* **2. Setor Tunai**: Meminta masukan nominal setor dengan validasi nominal harus lebih besar dari 0 (`nominal > 0`). Jika valid, saldo akan bertambah.
* **3. Tarik Tunai**: Meminta masukan nominal tarik dengan validasi saldo:
  - **Berhasil**: Jika nominal bernilai positif dan saldo mencukupi (`nominal <= saldo`).
  - **Gagal**: Jika nominal penarikan melebihi saldo yang tersedia.
* **4. Keluar**: Menampilkan pesan terima kasih dan mengakhiri perulangan menu utama.