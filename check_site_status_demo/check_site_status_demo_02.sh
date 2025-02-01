#!/bin/bash

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
