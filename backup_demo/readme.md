# Backup Demo

## 📌 Description
This script automatically creates a compressed backup (`.tar.gz`) of a specified directory and stores it in a dedicated backup folder. It also automatically deletes old backups older than **7 days** to prevent excessive storage usage.

## 🚀 Features
- Creates **timestamped backups** (e.g., `backup_2025-02-01_12-30-45.tar.gz`).
- Saves backups in a **designated folder** (`Backups_02`).
- **Automatically deletes** backups older than **7 days**.
- Ensures the **backup directory exists** before saving files.

## 🛠️ Usage
1. **Make the script executable** (if not already):
   ```bash
   chmod +x backup_demo_01.sh

2.	Run the script manually:
   ```bash
   ./backup_demo_01.sh
   ```

3.	Automate daily backups using cron:
Open the crontab editor:
   ```bash
   crontab -e
   ```
4. Add the following line to schedule a backup every day at 3:00 AM:
   ```bash
   0 3 * * * /path/to/backup.sh
   ```

📝 Code Explanation
	•	Defines the source directory (SOURCE_DIR).
	•	Creates a backup folder (mkdir -p).
	•	Archives files with a timestamp (tar -czf).
	•	Deletes old backups (find ... -mtime +7 -delete).

🛑 Requirements
	•	Bash shell (#!/bin/bash)
	•	tar (installed by default on macOS & Linux)
	•	cron (for automation)

## License
This script is open-source and can be modified as needed.

## Author
[Costa Epshtein]