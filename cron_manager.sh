#!/bin/bash
# Cron Manager - Skrip Automasi untuk Mengelola Crontab
# Dibuat agar portabel di berbagai sistem Linux.

# Fungsi untuk membersihkan layar dan menampilkan header
function show_header() {
    clear
    echo "========================================="
    echo "     Manajemen Crontab Interaktif"
    echo "========================================="
    echo
}

# 1. Fungsi untuk menampilkan semua cron job yang sedang berjalan
function list_crons() {
    echo "--- Daftar Cron Job Saat Ini ---"
    # 'crontab -l' untuk melihat. 'cat -n' untuk memberi nomor baris.
    # '2>/dev/null' untuk menyembunyikan error jika crontab kosong.
    crontab -l 2>/dev/null | cat -n
    if [ $? -ne 0 ]; then
        echo "Crontab kosong atau belum ada."
    fi
    echo "--------------------------------"
}

# Fungsi untuk mendapatkan jadwal cron secara interaktif
function get_schedule_interactive() {
    echo "Silakan masukkan interval waktu (biarkan kosong atau '*' untuk 'setiap')"
    echo "Format: Menit(0-59) Jam(0-23) Hari(1-31) Bulan(1-12) Hari_Minggu(0-7)"
    
    read -p "Menit [*/15]: " minute
    minute=${minute:-"*/15"} # Default setiap 15 menit

    read -p "Jam [*]: " hour
    hour=${hour:-"*"}

    read -p "Hari dalam Bulan [*]: " day_of_month
    day_of_month=${day_of_month:-"*"}

    read -p "Bulan [*]: " month
    month=${month:-"*"}

    read -p "Hari dalam Minggu [*]: " day_of_week
    day_of_week=${day_of_week:-"*"}

    # Mengembalikan jadwal yang sudah diformat
    SCHEDULE="$minute $hour $day_of_month $month $day_of_week"
}

# 4. Fungsi untuk menambah cron job baru
function add_cron() {
    get_schedule_interactive
    echo
    echo "Masukkan Perintah Lengkap yang akan dieksekusi."
    echo "Contoh: /usr/bin/python3 /home/user/scripts/backup.py"
    echo "Atau untuk akses ke luar: /usr/bin/curl -s https://example.com/api/trigger"
    read -p "Perintah: " command

    if [ -z "$command" ]; then
        echo "Perintah tidak boleh kosong. Penambahan dibatalkan."
        return
    fi
    
    # Menambahkan job baru ke crontab
    (crontab -l 2>/dev/null; echo "$SCHEDULE $command") | crontab -
    
    if [ $? -eq 0 ]; then
        echo "✅ Cron job berhasil ditambahkan!"
        echo "$SCHEDULE $command"
    else
        echo "❌ Gagal menambahkan cron job."
    fi
}

# 3. Fungsi untuk menghapus cron job
function delete_cron() {
    list_crons
    # Cek apakah ada cron job untuk dihapus
    if [ -z "$(crontab -l 2>/dev/null)" ]; then
        return
    fi

    read -p "Masukkan nomor baris cron yang akan dihapus (atau 'c' untuk batal): " line_num
    
    if [[ "$line_num" == "c" ]]; then
        echo "Penghapusan dibatalkan."
        return
    fi

    # Validasi input harus angka
    if ! [[ "$line_num" =~ ^[0-9]+$ ]]; then
        echo "❌ Input tidak valid. Harap masukkan nomor baris."
        return
    fi

    # 'sed' digunakan untuk menghapus baris spesifik
    crontab -l | sed "${line_num}d" | crontab -

    if [ $? -eq 0 ]; then
        echo "✅ Cron job pada baris $line_num berhasil dihapus."
    else
        echo "❌ Gagal menghapus cron job. Pastikan nomor baris valid."
    fi
}

# 2. Fungsi untuk mengedit cron job
function edit_cron() {
    list_crons
    # Cek apakah ada cron job untuk diedit
    if [ -z "$(crontab -l 2>/dev/null)" ]; then
        return
    fi

    read -p "Masukkan nomor baris cron yang akan diedit (atau 'c' untuk batal): " line_num
    
    if [[ "$line_num" == "c" ]]; then
        echo "Pengeditan dibatalkan."
        return
    fi

    if ! [[ "$line_num" =~ ^[0-9]+$ ]]; then
        echo "❌ Input tidak valid. Harap masukkan nomor baris."
        return
    fi
    
    # Ambil cron lama
    old_cron=$(crontab -l | sed -n "${line_num}p")
    if [ -z "$old_cron" ]; then
        echo "❌ Nomor baris tidak ditemukan."
        return
    fi

    echo "Anda akan mengedit: $old_cron"
    echo "--- Masukkan Detail Baru ---"
    get_schedule_interactive
    echo
    echo "Masukkan Perintah Lengkap yang baru."
    read -p "Perintah baru: " new_command

    if [ -z "$new_command" ]; then
        echo "Perintah tidak boleh kosong. Pengeditan dibatalkan."
        return
    fi

    new_cron="$SCHEDULE $new_command"
    
    # 'sed' dengan opsi 'c' untuk mengganti (change) seluruh baris
    crontab -l | sed "${line_num}c\\${new_cron}" | crontab -
    
    if [ $? -eq 0 ]; then
        echo "✅ Cron job berhasil diubah menjadi:"
        echo "$new_cron"
    else
        echo "❌ Gagal mengubah cron job."
    fi
}

# --- Menu Utama ---
while true; do
    show_header
    echo "Pilih salah satu opsi di bawah ini:"
    echo "  1. Lihat semua cron job yang berjalan"
    echo "  2. Edit cron job"
    echo "  3. Hapus cron job"
    echo "  4. Tambah cron job baru"
    echo "  q. Keluar"
    echo
    read -p "Pilihan Anda: " choice

    case $choice in
        1)
            show_header
            list_crons
            ;;
        2)
            show_header
            edit_cron
            ;;
        3)
            show_header
            delete_cron
            ;;
        4)
            show_header
            add_cron
            ;;
        q|Q)
            echo "Terima kasih telah menggunakan skrip ini. Sampai jumpa!"
            exit 0
            ;;
        *)
            echo "❌ Pilihan tidak valid, silakan coba lagi."
            ;;
    esac
    echo
    read -p "Tekan [Enter] untuk kembali ke menu utama..."
done