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
# Modify here to get about other HTTP status codes
)

#Deleting old CSV file
if [[ $(find . -name "*_log.csv") ]]; then
    echo "Deleting old Record files..."
    find . -name "*_log.csv" -print0 | xargs -0 rm
else
    echo "No Record files found."
fi

#creating CSV Named Date_Time_log.csv
log_date=$(whoami)_$(date +"%Y-%m-%d_%H:%M:%S")_log
log_csv="$log_date.csv"
echo "Timestamp,Request_Name,Status,Count" >> "$log_csv"

# Parse the log file and compute total number of requests
access=$(awk '{print $9}' access.log | wc -l)
echo "Total Requests: $access"

timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
csv_row="$timestamp"

for code in "${!error_codes[@]}"; do
    # Count the number of occurrences of the error code
    count=$(awk -v code=${error_codes[$code]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        # Compute the error rate and print the results
        error_rate=$(awk "BEGIN { printf \"%.4f\", $count * 100 / $access }")
        echo "Number of $code error found: $count"

        echo "Percentage of $code: $error_rate%"
        csv_row="$csv_row,$count,$error_rate%"
    else
        csv_row="$csv_row,0,0%"
        
    fi
done

echo "$csv_row" >> "$log_csv"