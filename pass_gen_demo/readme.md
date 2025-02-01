
# Password Generator Demo

## 📌 Description
This script generates **random passwords** with a length of **12 characters** using the OpenSSL library. It ensures passwords contain only **letters (A-Z, a-z) and digits (0-9)**, removing special characters.

## 🚀 Features
- Generates **5 random passwords**.
- Ensures **passwords contain only alphanumeric characters**.
- Supports **colored output** for better readability.
- Allows **easy customization** of password length.

## 🛠️ Usage
1. **Make the script executable** (if not already):
   ```bash
   chmod +x pass_gen_demo.sh
   ```

2.	Run the script:
   ```bash
   ./pass_gen_demo.sh
   ```
📝 Code Explanation
	•	Uses a loop (for i in {1..5}) to generate multiple passwords.
	•	Generates random bytes using OpenSSL (openssl rand -base64 12).
	•	Removes special characters (tr -dc 'A-Za-z0-9').
	•	Ensures the correct password length (cut -c -12).
	•	Adds colors for better readability (tput setaf 2 for green text).

🎯 Customization
	•	Change the number of passwords by modifying {1..5}.
	•	Adjust password length using:
   ```bash
   PASS_LENGTH=16  # Change length
   ```
🛑 Requirements
	•	Bash shell (#!/bin/bash)
	•	OpenSSL (openssl rand)
	•	tput (for colored output, included in most Unix systems)

## License
This script is open-source and can be modified as needed.

## Author
[Costa Epshtein]