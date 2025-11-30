# Sistem Backup Otomatis - Shell Script

## Deskripsi Project
Project ini merupakan sistem backup otomatis berbasis **Shell Script** yang berfungsi untuk melakukan kompresi folder sumber, menyimpan hasil backup dengan format **timestamp**, mencatat log proses backup, serta melakukan **rotasi backup** dengan otomatis apabila usia backup melebihi batas hari yang ditentukan. Sistem ini membantu menjaga keamanan data dan memudahkan manajemen arsip file penting secara efisien.

## Tujuan Program
Program ini dibuat untuk:
- Melakukan backup folder tertentu secara otomatis
- Menyimpan backup dengan nama file **backup-YYYYMMDD-HHMMSS.tar.gz**
- Mencatat proses backup ke dalam file **backup.log**
- Menghapus file backup yang sudah lebih lama dari jumlah hari yang ditentukan (rotasi backup)

## Cara Kerja Program
1. Program meminta input dari user:
   - Folder sumber (source folder) yang akan di-backup
   - Folder tujuan (destination folder) tempat backup disimpan
   - Jumlah hari penyimpanan maksimum (retention days)

2. Script melakukan validasi:
   - Mengecek apakah folder sumber tersedia
   - Mengecek apakah folder tujuan ada, jika tidak maka dibuat otomatis

3. Script membuat file backup menggunakan perintah berikut:
   ```bash
   tar -czf backup-YYYYMMDD-HHMMSS.tar.gz
   ```

4. Script menyimpan log aktivitas dalam file `backup.log`, berisi:
   - Waktu mulai backup
   - Waktu selesai backup
   - Ukuran file backup
   - Status backup (SUCCESS/GAGAL)

5. Melakukan rotasi backup menggunakan perintah:
   ```bash
   find "folder_tujuan" -name "backup-*.tar.gz" -mtime +X -exec rm {} \;
   ```

6. Menampilkan pesan hasil proses di terminal.

---

## Struktur Direktori Project
```
6_PROJECT_UAS_LABSO_B/
├── backup/                    # folder tujuan backup
│   ├── backup-*.tar.gz
│   └── backup.log
├── Source1/                   # folder sumber backup
│   └── text.txt
├── src/
│   └── main.sh                # file script utama
└── README.md                  # dokumentasi project
```

---

## Cara Setup dan Menjalankan Script
### **1. Pastikan environment Bash tersedia**
Jika menggunakan Windows, jalankan melalui:
- **Git Bash** atau
- **WSL (Ubuntu/Linux)**

### **2. Masuk ke folder project**
```bash
cd 6_PROJECT_UAS_LABSO_B/src
```

### **3. Berikan permission eksekusi**
```bash
chmod +x main.sh
```

### **4. Jalankan script**
```bash
bash main.sh
```

### **Contoh Input**
```
Masukkan folder sumber: D:/NAJWA/Semester 3/SO/6_Project_UAS_LabSO_B/Source1
Masukkan folder tujuan: D:/NAJWA/Semester 3/SO/6_Project_UAS_LabSO_B/backup
Masukkan retention days: 1
```

### **Contoh Output Terminal**
```
Backup dimulai: 2025-11-29 19:12:48
Backup selesai: backup-20251129-191248.tar.gz
Ukuran backup: 12.5 MB
Backup tersimpan di /backup
Backup lebih dari 1 hari dihapus (rotasi backup)
```

### **Hasil Running main.sh**
![alt text](Terminal.jpg)

### **Hasil backup.log setelah running main.sh**
![alt text](Backup_log.png)

## Anggota Kelompok 6
* Shara Sitta Safiruddin (2408107010067)

* Syarifah Najwa (2408107010064)

* Cut Mutia Rahmah (2408107010062)
