#!/bin/bash

# 🔥 Improved version (with a dedicated backup location)
# Currently, the archive is saved in the same folder where the script is run.
# It is better to store it in a dedicated folder: ~/Backups.

SOURCE_DIR="$HOME/Desktop/bash-course"
BACKUP_DIR="$HOME/Desktop/bash-course/Backups_01"  # Directory for storing backups

mkdir -p "$BACKUP_DIR"  # Create the backup folder if it doesn't exist

tar -czf "$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

echo "Backup saved to $BACKUP_DIR"

# 📌 What has improved?
# 	•	BACKUP_DIR="$HOME/Backups" — now backups are stored in a separate folder.
# 	•	mkdir -p "$BACKUP_DIR" — automatically creates the folder if it doesn’t exist.

# 🚀 Additionally: automatic deletion of old backups

# If you don’t want backups to accumulate indefinitely, delete old ones (e.g., older than 7 days):

find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -delete

