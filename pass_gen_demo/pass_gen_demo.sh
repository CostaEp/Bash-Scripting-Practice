#!/bin/bash

# Generate 5 random passwords (using seq)
# | cut -c -12 shows only the first 12 characters
# This password includes all symbols

for i in $(seq 1 5); do
    openssl rand -base64 12 | cut -c -12
done

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


# 🔥 Explanation of improvements:
# 	1. PASS_LENGTH=12 → Allows easy modification of password length.
# 	2. echo -e "$(tput setaf 2)Pass $i:$(tput sgr0)"
# 	• tput setaf 2 → Green text color.
# 	• tput sgr0 → Resets color after output.
# 	3. cut -c -$PASS_LENGTH → Uses a variable instead of a fixed number.

PASS_LENGTH=12  # Password length

for i in {1..5}; do
    echo -e "$(tput setaf 2)Pass $i:$(tput sgr0)"  # Green text color
    openssl rand -base64 12 | tr -dc 'A-Za-z0-9' | cut -c -$PASS_LENGTH
done

# This script generates 5 random passwords in three different ways:
# 	1.	Using seq – The simplest method, but it spawns an extra process.
# 	2.	Using {1..5} – More efficient as it avoids an external seq command.
# 	3.	With color formatting and a variable for length (PASS_LENGTH) – The most flexible and visually improved version.