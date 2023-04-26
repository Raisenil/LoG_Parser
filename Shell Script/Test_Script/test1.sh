#!/bin/bash

# Define error codes and their corresponding HTTP status codes
declare -A error_codes=(
    [301]=301
    [304]=304
    [401]=401
    [403]=403
    [404]=404
    [405]=405
    [501]=501
    [502]=502
    [503]=503
    [504]=504
# Modify here to search about other HTTP status codes
)

# Parse the log file and compute total number of requests
access=$(awk '{print $9}' access.log | wc -l)
echo "Total Requests: $access"

# Iterate over error codes and compute error rate for each one
for code in "${!error_codes[@]}"; do
    # Count the number of occurrences of the error code
    count=$(awk -v code=${error_codes[$code]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        # Compute the error rate and print the results
        error_rate=$(awk "BEGIN { printf \"%.4f\", $count * 100 / $access }")
        echo "Number of $code error found: $count"
        echo "Percentage of $code: $error_rate%"
    fi
done
