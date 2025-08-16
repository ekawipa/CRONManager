Cron Manager Script Interactif

cron_manager.sh adalah sebuah skrip bash yang dirancang untuk menyederhanakan pengelolaan crontab di sistem operasi Linux. Dibuat khusus untuk para DevOps Engineer, System Administrator, dan developer yang sering berinteraksi dengan cron job, skrip ini menyediakan antarmuka menu interaktif untuk menghindari kesalahan manual saat mengedit file crontab secara langsung.

Skrip ini bersifat portabel dan dapat berjalan di hampir semua distribusi Linux tanpa memerlukan dependensi tambahan.

✨ Fitur Utama

    Antarmuka Berbasis Menu: Navigasi yang mudah dan intuitif untuk semua operasi.

    Lihat Cron Jobs: Menampilkan semua cron job yang aktif dengan nomor baris untuk referensi yang mudah.

    Tambah Cron Job: Menambahkan job baru dengan panduan interaktif untuk mengatur jadwal waktu (menit, jam, hari, dll.).

    Edit Cron Job: Mengubah jadwal atau perintah dari cron job yang sudah ada dengan memilih nomor barisnya.

    Hapus Cron Job: Menghapus cron job dengan aman hanya dengan memasukkan nomor baris.

    Portabel: Menggunakan perintah standar Linux (bash, crontab, sed, cat) yang tersedia secara universal.

    Aman: Mengurangi risiko kesalahan sintaks yang dapat melumpuhkan semua cron job.

📋 Prasyarat

    Sistem operasi berbasis Linux (Ubuntu, CentOS, Debian, Fedora, dll.).

    Bash (Bourne Again SHell) terinstal.

    Utilitas dasar seperti crontab, sed, cat, dan grep. (Hampir selalu tersedia secara default).

🚀 Instalasi dan Penggunaan

Ikuti langkah-langkah sederhana di bawah ini untuk memulai.

1. Unduh atau Buat File Skrip

Salin kode dari cron_manager.sh dan simpan ke dalam file di server Anda.
Bash

# Anda bisa menggunakan editor teks seperti nano atau vim
nano cron_manager.sh

Tempelkan seluruh isi skrip ke dalam editor, lalu simpan dan tutup file.

2. Berikan Izin Eksekusi

Jadikan skrip dapat dieksekusi dengan perintah chmod.
Bash

chmod +x cron_manager.sh

3. Jalankan Skrip

Eksekusi skrip dari terminal Anda.
Bash

./cron_manager.sh

Anda akan langsung disambut oleh menu utama.

📖 Penjelasan Opsi Menu

Setelah skrip dijalankan, Anda akan melihat menu berikut:

=========================================
     Manajemen Crontab Interaktif
=========================================

Pilih salah satu opsi di bawah ini:
  1. Lihat semua cron job yang berjalan
  2. Edit cron job
  3. Hapus cron job
  4. Tambah cron job baru
  q. Keluar

Pilihan Anda:

    Opsi 1: Lihat semua cron job yang berjalan
    Menampilkan daftar semua cron job yang sedang aktif untuk pengguna saat ini. Setiap baris akan diberi nomor untuk memudahkan proses edit atau hapus.

    Opsi 2: Edit cron job
    Meminta Anda memasukkan nomor baris dari cron job yang ingin diubah. Setelah itu, Anda akan dipandu untuk memasukkan jadwal waktu dan perintah yang baru.

    Opsi 3: Hapus cron job
    Meminta Anda memasukkan nomor baris dari cron job yang ingin dihapus. Skrip akan mengkonfirmasi dan menghapus baris tersebut dari crontab.

    Opsi 4: Tambah cron job baru
    Memandu Anda melalui proses pembuatan cron job baru. Anda akan diminta untuk mengisi setiap field jadwal (menit, jam, dll.) secara interaktif dan memasukkan perintah lengkap yang akan dieksekusi.

    Opsi q: Keluar
    Untuk keluar dari skrip dan kembali ke shell terminal Anda.

📝 Lisensi

Skrip ini dirilis di bawah Lisensi MIT. Anda bebas untuk memodifikasi dan mendistribusikannya sesuai kebutuhan.
