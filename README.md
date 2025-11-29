# 6_Project_UAS_LabSO_B

# Backup Otomatis dengan Rotasi

Script ini merupakan program **Sistem backup otomatis** berbasis **Bash** yang berfungsi untuk membuat arsip backup dari folder tertentu, menyimpannya pada folder tujuan, mencatat log proses backup, serta melakukan **rotasi backup** berdasarkan jumlah hari penyimpanan.

---

## 📌 Fitur Utama

* Input folder **sumber** dan **tujuan** secara interaktif
* Mengecek keberadaan folder sumber dan tujuan
* Jika folder tujuan tidak ada, script akan membuatnya otomatis
* Membuat file backup dengan format `.tar.gz`
* Mencatat log proses backup (waktu mulai, selesai, dan ukuran file)
* Melakukan **rotasi backup otomatis** berdasarkan jumlah hari yang ditentukan

---

## 📂 Cara Kerja Program

### 1. **Input Pengguna**

Program meminta pengguna memasukkan:

* Folder sumber (yang akan di-backup)
* Folder tujuan (lokasi penyimpanan)
* Jumlah hari retensi backup (untuk rotasi)

### 2. **Validasi Folder**

* Script mengecek apakah folder sumber ada
* Script membuat folder tujuan jika belum ada

### 3. **Pembuatan Backup**

Backup dibuat dengan format:

```
backup-YYYYMMDD-HHMMSS.tar.gz
```

Menggunakan perintah:

```
tar -czf
```

### 4. **Pencatatan Log**

Setiap proses dicatat di file:

```
backup.log
```

Isi log meliputi:

* Waktu mulai backup
* Waktu selesai backup
* Lokasi file backup
* Ukuran file
* Status sukses atau gagal

### 5. **Rotasi Backup**

Backup yang lebih tua dari jumlah hari retensi akan otomatis dihapus:

```
find "$TUJUAN" -name "backup-*.tar.gz" -mtime +RETENTION_DAYS -exec rm {} \;
```

---

## ▶️ Cara Menjalankan Script

1. Pastikan file script memiliki izin eksekusi:

```
chmod +x main.sh
```

2. Jalankan program:

```
./main.sh
```

3. Masukkan input sesuai instruksi pada terminal

---

## 📑 Contoh Log Backup

Contoh isi file `backup.log`:

```
2025-11-29-18:35:10 | Backup dimulai: /home/user/data
2025-11-29-18:35:15 | Backup selesai: /backup/backup-20251129-183510.tar.gz
2025-11-29-18:35:15 | Size: 25M | Status: SUCCESS
```