#!/bin/bash

# This script checks if a website (URL) is online by making an HTTP request using curl. 
# If the HTTP response contains 200, it confirms that the site is online; otherwise,
# it reports that the site is down.

    # •	This variable stores the URL of the website that we want to check.
URL="https://www.google.com"


	# •	This condition checks if the website returns an HTTP 200 OK response.
	# •	curl -s --head "$URL" → Fetches only the headers (--head) from the URL silently (-s suppresses unnecessary output).
	# •	head -n 1 → Extracts only the first line of the response (which contains the HTTP status code).
	# •	grep "200" → Searches for "200" in that first line, which indicates HTTP 200 OK (successful request).
	# •	> /dev/null → Hides the output, so the script only evaluates success/failure.
	# •	If the response contains 200, the if condition is true, meaning the site is online.

if curl -s --head "$URL" | head -n 1 | grep "200" > /dev/null; then
	# •	If the condition is true, this message is displayed.
    echo "Our site is online and working"
else
	# •	If the HTTP status is not 200, the script enters the else block and prints a message indicating that the site is down.
    echo "Our site Down Check again later"
fi
#------------------------------------------------------------------------------
# Define the URL to check
URL="https://www.google.com"

# Validate if URL is not empty
	# -z "$URL" → Checks if the variable $URL is empty.
	# The if statement runs the following block only if $URL is empty.
if [ -z "$URL" ]; then
    echo "Error: No URL specified. Please provide a valid URL."
    exit 1
fi
# 🛑 Why is this Check Important?
# 	If you accidentally run the script without setting a URL, it prevents unnecessary execution.
# 	Avoids errors when curl tries to fetch an empty URL.
# 	Ensures that the script only runs when a valid URL is provided.

# Perform the site availability check
if curl -s --head "$URL" | head -n 1 | grep -q "^HTTP/.* 200"; then
    echo "$(tput setaf 2)✅ Our site is online and working$(tput sgr0)"
else
    echo "$(tput setaf 1)❌ Our site is down! Check again later.$(tput sgr0)"
fi
# 📝 Summary
# 	Defines a URL variable (URL).
# 	Checks if it’s empty (-z "$URL").
# 	Prints an error and exits (exit 1) if no URL is set.
# 	Prevents unnecessary script execution and errors.
#------------------------------------------------------------------------------
# Define the URL to check
URL="https://www.google.com"

# Validate if URL is not empty
if [ -z "$URL" ]; then
    echo "Error: No URL specified. Please provide a valid URL."
    exit 1
fi

# Perform the site availability check
	# curl -s -o /dev/null -w "%{http_code}" "$URL"
	# -s → Runs curl silently (hides unnecessary output).
	# -o /dev/null → Discards the response body (we only need the status code).
	# -w "%{http_code}" → Extracts the HTTP response code (e.g., 200, 404, 503).
	# Stores the response code in the variable $HTTP_RESPONSE.
HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

	# Checks if the HTTP response code is 200 (meaning the site is online).
	# If $HTTP_RESPONSE equals 200, it prints a green “✅ Site is online” message.
if [ "$HTTP_RESPONSE" -eq 200 ]; then
    echo "$(tput setaf 2)✅ Our site is online and working$(tput sgr0)"
else
	# If the HTTP response is not 200, the script does the following:
	# 1.Gets the first line of the HTTP response header:
        # curl -s --head "$URL" → Fetches only the HTTP headers.
	    # head -n 1 → Extracts only the first line, which contains the status code.
	    # Stores the result in $ERROR_MSG.
	# 2.Prints a “Our site is Down” message in red:
    # 3.Displays the HTTP error code in yellow:
    # 4.Displays the full HTTP response header:

    ERROR_MSG=$(curl -s --head "$URL" | head -n 1)
    echo "$(tput setaf 1)❌ Our site is down!$(tput sgr0)"
    echo "$(tput setaf 3)🔴 Error Code: $HTTP_RESPONSE$(tput sgr0)"
    echo "$(tput setaf 3)🔍 Response: $ERROR_MSG$(tput sgr0)"
fi

# ✅ Why is this Script Better?
# 	1.	More Accurate Check
# 	•	Instead of just grep "200", it directly extracts the HTTP status code.
# 	2.	Prevents Empty URL Issues
# 	•	Exits early if $URL is empty.
# 	3.	Shows Detailed Error Information
# 	•	Prints the exact HTTP status code.
# 	•	Displays the full server response to help troubleshoot.
# 	4.	Uses Colors for Readability
# 	•	Green (✅) for “Online”.
# 	•	Red (❌) for “Down”.
# 	•	Yellow (🔴) for “Error Code”.
#------------------------------------------------------------------------------
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