#!/bin/bash

# Input
echo "--- Sistem Backup Otomatis ---"
read -p "Masukkan folder sumber (Source Folder) yang ingin di-backup: " SOURCE
read -p "Masukkan folder tujuan (Destination Folder) untuk menyimpan backup: " TUJUAN
read -p "Masukkan jumlah hari maksimum penyimpanan backup (Retention Days): " RETENTION_DAYS

# Cek Folder SOURCE
if [ -d "$SOURCE" ]; then
    echo "Folder source ada"
else
    echo "Folder source tidak ada"
    exit 1
fi

# Cek Folder Tujuan
if [ -d "$TUJUAN" ]; then 
    echo "Folder Tujuan udh ada"
else 
    echo "Folder Tujuan blm ada"
    mkdir "$TUJUAN"
fi

mkdir 

# Catat Waktu Backup
TIMESTAMP=$(date +"%Y%m%d-%H%M%S" )

START=$(date +"%Y-%m-%d-%H:%M:%S")
echo "$START | Backup dimulai: $SOURCE" >> "$TUJUAN/backup.log"

# Membuat Backup
echo "Membuat backup..."
tar -czf "$TUJUAN/backup-$TIMESTAMP.tar.gz" "$SOURCE"

# Menyimpan Log backup
if [ $? -eq 0 ]; then
    echo "Backup dimulai: $START"

    # Catat Waktu selesai Backup
    END=$(date +"%Y-%m-%d-%H:%M:%S")
    echo "$END | Backup selesai: $TUJUAN/backup-$TIMESTAMP.tar.gz" >> "$TUJUAN/backup.log"
    echo "Backup selesai: $END"

    # Catat ukuran file Backup
    SIZE=$(du -h "$TUJUAN/backup-$TIMESTAMP.tar.gz" | cut -f1)
    echo "$END | Size: $SIZE | Status: SUCCESS" >> "$TUJUAN/backup.log"
    echo "Ukuran backup: $SIZE"

    echo "Backup tersimpan di: $TUJUAN/backup-$TIMESTAMP.tar.gz"

    # Rotasi backup
    find "$TUJUAN" -name "backup-*.tar.gz" -mtime +"$RETENTION_DAYS" -exec rm {} \;
    echo "Backup lebih dari $RETENTION_DAYS hari dihapus (rotasi backup)"

else
    echo "Backup gagal dilakukan"
    echo "Cek Log: $TUJUAN/backup.log"
fi 