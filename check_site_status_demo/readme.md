# Check Site Status Script

## Overview
This script (`check_site_status_demo.sh`) checks if a website is online by making HTTP requests using `curl`. It evaluates the HTTP response status and provides a corresponding message indicating whether the site is up or down.

## Features
- Checks if a single website is online.
- Provides a detailed error message when the site is down.
- Uses color-coded output for better readability.
- Supports checking multiple websites at once.
- Prevents execution if no URL is provided.

## Prerequisites
- A Unix-based system (Linux/macOS)
- `bash` shell
- `curl` installed (default on most Unix-based systems)

## Installation
No installation is required. Just download or copy the script and run it in a terminal.

## Usage
### Checking a Single Website
1. Open a terminal.
2. Run the script using:
   ```bash
   ./check_site_status_demo.sh
   ```

### Checking Multiple Websites
Modify the `URLS` array in the script to include multiple websites:
```bash
URLS=("https://www.google.com" "https://github.com/" "https://invalid-site.com")
```
Then, execute the script as usual.

## Explanation of the Script
### Step 1: Define the URL
The script defines a URL to check:
```bash
URL="https://www.google.com"
```

### Step 2: Validate URL
If the URL is empty, the script exits with an error:
```bash
if [ -z "$URL" ]; then
    echo "Error: No URL specified. Please provide a valid URL."
    exit 1
fi
```

### Step 3: Perform the Site Check
#### Method 1: Checking for HTTP 200 Response
```bash
if curl -s --head "$URL" | head -n 1 | grep -q "^HTTP/.* 200"; then
    echo "$(tput setaf 2)✅ Our site is online and working$(tput sgr0)"
else
    echo "$(tput setaf 1)❌ Our site is down! Check again later.$(tput sgr0)"
fi
```
#### Method 2: Extracting HTTP Status Code
```bash
HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_RESPONSE" -eq 200 ]; then
    echo "$(tput setaf 2)✅ Our site is online and working$(tput sgr0)"
else
    ERROR_MSG=$(curl -s --head "$URL" | head -n 1)
    echo "$(tput setaf 1)❌ Our site is down!$(tput sgr0)"
    echo "$(tput setaf 3)🔴 Error Code: $HTTP_RESPONSE$(tput sgr0)"
    echo "$(tput setaf 3)🔍 Response: $ERROR_MSG$(tput sgr0)"
fi
```

### Step 4: Checking Multiple Websites
```bash
URLS=("https://www.google.com" "https://github.com/" "https://invalid-site.com")

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
```

## Why This Script is Useful
- **Accurate Check**: Extracts the exact HTTP status code.
- **Prevents Empty URL Errors**: Ensures the script only runs with a valid URL.
- **Displays Detailed Error Messages**: Helps diagnose website issues.
- **Color-Coded Output**: Improves readability.

## License
This script is open-source and can be modified as needed.

## Author
[Costa Epshtein]

