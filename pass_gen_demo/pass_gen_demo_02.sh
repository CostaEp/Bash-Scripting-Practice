#!/bin/bash
# seq 1 5 creates a separate process, which slightly slows down execution.
# It can be replaced with {1..5} for a pure Bash solution:

# Generate 5 random passwords (using {1..5})
# 🔥 Explanation:
# 	1. openssl rand -base64 12 → Generates 12 random bytes and encodes them in Base64.
# 	2. tr -dc 'A-Za-z0-9' → Removes everything except letters (A-Z, a-z) and digits (0-9).
# 	3. cut -c -12 → Extracts only the first 12 characters to ensure the password is exactly 12 characters long.

for i in {1..5}; do
    echo "pass $i:"

    openssl rand -base64 12 | tr -dc 'A-Za-z0-9' | cut -c -12
    #openssl rand -base64 12 | cut -c -12
done