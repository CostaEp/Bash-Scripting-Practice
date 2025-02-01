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