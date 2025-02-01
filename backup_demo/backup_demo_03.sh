#!/bin/bash

# Here is the full Bash script for automatic backups that also deletes old backups (older than 7 days):

# 📌 Directory to be backed up
SOURCE_DIR="$HOME/Desktop/bash-course"

# 📌 Directory for storing backups
BACKUP_DIR="$HOME/Desktop/bash-course/Backups_02"

# 📌 Create the backup directory if it doesn’t exist
mkdir -p "$BACKUP_DIR"

# 📌 Archive file name with timestamp
BACKUP_FILE="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# 📌 Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# 📌 Delete backups older than 7 days
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -delete

# 📌 Output information
echo "Backup saved to $BACKUP_DIR/$BACKUP_FILE"
echo "Old backups older than 7 days have been deleted."

#------------------------------------------------------------------------------
# 🚀 Key Improvements:
# 	1.	Backups are saved in a dedicated folder (Backups_01 or Backups_02) instead of the script’s execution directory.
# 	2.	Automatic folder creation (mkdir -p "$BACKUP_DIR") ensures the backup directory exists.
# 	3.	Time-based filenames (backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz) prevent overwriting multiple backups on the same day.
# 	4.	Automatic cleanup deletes backups older than 7 days (find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -delete).