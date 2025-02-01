#!/bin/bash

# ✅ What does this script do?
# 	1.	SOURCE_DIR="$HOME/Desktop/bash-course"
# 	•	Defines the directory you want to archive.
# 	2.	tar -czf "backup_$(date +%Y-%m-%d).tar.gz"
# 	•	Creates an archive with the current date (example: backup_2025-02-01.tar.gz).
# 	3.	-C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
# 	•	Navigates to the parent directory so that the archive contains only bash-course and not the full path.
# 	4.	echo "End Backup"
# 	•	Prints a message when the process is complete.

SOURCE_DIR="$HOME/Desktop/bash-course"

tar -czf "backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

echo "End Backup"

#------------------------------------------------------------------------------
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

#------------------------------------------------------------------------------

# Here is the full Bash script for automatic backups that also deletes old backups (older than 7 days):

#!/bin/bash

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