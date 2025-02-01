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
