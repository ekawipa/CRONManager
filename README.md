# 🕒 Cron Manager

`cron_manager.sh` adalah script Bash sederhana untuk mempermudah manajemen **cron jobs** secara interaktif tanpa perlu mengedit file `crontab` secara manual.

## ✨ Fitur
- ➕ Menambahkan cron job baru
- ❌ Menghapus cron job berdasarkan nomor urut
- 📜 Menampilkan semua cron job aktif
- 🔄 Update otomatis ke dalam `crontab`

## 📦 Instalasi
Clone repository ini terlebih dahulu:

```bash
git clone https://github.com/ekawipa/CRONManager.git
cd CRONManager
chmod +x cron_manager.sh
```
🚀 Cara Penggunaan

Jalankan script dengan:
```bash
./cron_manager.sh
```
Lalu pilih menu yang tersedia:
```bash
===========================
 Cron Manager - Menu Utama
===========================
1. Tambah Cron Job
2. Hapus Cron Job
3. Lihat Cron Jobs
4. Keluar
===========================
Pilih opsi [1-4]:
```
➕ Tambah Cron Job
Kamu akan diminta memasukkan jadwal cron (misalnya * * * * *) dan perintah yang ingin dijalankan.

❌ Hapus Cron Job
Script akan menampilkan daftar cron jobs, lalu kamu tinggal memilih nomor urut job yang ingin dihapus.

📜 Lihat Cron Jobs

Menampilkan daftar cron jobs yang aktif di user saat ini.

⚠️ Catatan

    Script ini hanya mengatur cron jobs untuk user yang sedang aktif.

    Pastikan kamu sudah memahami format cron expression:

    ┌───────────── menit (0 - 59)
    │ ┌───────────── jam (0 - 23)
    │ │ ┌───────────── hari (1 - 31)
    │ │ │ ┌───────────── bulan (1 - 12)
    │ │ │ │ ┌───────────── hari dalam minggu (0 - 6) (Minggu=0)
    │ │ │ │ │
    * * * * *  perintah yang dijalankan

🛠️ Contoh

Menjalankan backup database setiap jam 2 pagi:
```bash
0 2 * * * /home/user/scripts/backup.sh
```

🤝 Kontribusi
Pull request dipersilakan! Jika ada bug atau fitur baru yang diinginkan, silakan buka issue.
📜 Lisensi

MIT License © 2025
========================================
Author : Eka W. Prasetya (@ekawprasetya)
