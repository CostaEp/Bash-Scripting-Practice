#!/bin/bash

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