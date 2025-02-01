#!/bin/bash

# 🚀 Bonus: Check Multiple Websites
# Want to check multiple websites at once? Use this version:

URLS=("https://www.google.com" "https://github.com/" "https://www.github.com" "https://invalid-site.com")

for URL in "${URLS[@]}"; do
    echo -n "Checking $URL... "
    
    HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    if [ "$HTTP_RESPONSE" -eq 200 ]; then
        echo "$(tput setaf 2)✅ Online$(tput sgr0)"
    else
        ERROR_MSG=$(curl -s --head "$URL" | head -n 1)
        echo "$(tput setaf 1)❌ Down$(tput sgr0)"
        echo "$(tput setaf 3)🔴 Error Code: $HTTP_RESPONSE$(tput sgr0)"
        echo "$(tput setaf 3)🔍 Response: $ERROR_MSG$(tput sgr0)"
    fi
done