#!/bin/bash
# Backup otomatis Moodle SMKN 5 Telkom Banda Aceh
# Menyimpan: database MySQL + file konfigurasi + backup Moodle internal

set -e

BACKUP_DIR="/root/moodle-backups"
RETENTION_DAYS=14
STAMP=$(date +%Y%m%d-%H%M%S)
LOG="/root/moodle-backups/backup.log"

mkdir -p "$BACKUP_DIR"

echo "[$STAMP] Mulai backup" >> "$LOG"

# 1. Dump database MySQL dari container
docker compose -f /root/moodle/docker-compose.yml exec -T db \
    mysqldump -umoodle -pmoodle_password_2026 --single-transaction --routines moodle \
    > "$BACKUP_DIR/moodle-db-$STAMP.sql" 2>> "$LOG"

# 2. Kompres database
gzip -f "$BACKUP_DIR/moodle-db-$STAMP.sql"

# 3. Backup data Moodle (moodledata) - salin dari volume
docker run --rm --volumes-from moodle-php \
    -v "$BACKUP_DIR":/backup alpine \
    tar czf "/backup/moodledata-$STAMP.tar.gz" -C /var/www moodledata 2>> "$LOG"

# 4. Backup kode Moodle (config.php)
tar czf "$BACKUP_DIR/moodle-html-$STAMP.tar.gz" -C /root/moodle html 2>> "$LOG"

# 5. Hapus backup lebih lama dari RETENTION_DAYS hari
find "$BACKUP_DIR" -name "moodle-*" -mtime +$RETENTION_DAYS -delete 2>> "$LOG"

echo "[$STAMP] Selesai. Isi $BACKUP_DIR:" >> "$LOG"
ls -lh "$BACKUP_DIR" | tail -5 >> "$LOG"