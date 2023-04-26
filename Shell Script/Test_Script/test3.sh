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
log_date=$(date +"%Y-%m-%d_%H:%M:%S"_log)
log_csv="$log_date.csv"
echo "Timestamp,Total Requests,Number of 301 error found,Percentage of 301,Number of 304 error found,Percentage of 304,Number of 401 error found,Percentage of 401,Number of 403 error found,Percentage of 403,Number of 404 error found,Percentage of 404,Number of 405 error found,Percentage of 405,Number of 501 error found,Percentage of 501,Number of 502 error found,Percentage of 502,Number of 503 error found,Percentage of 503,Number of 504 error found,Percentage of 504" >> "$log_csv"

# Parse the log file and compute total number of requests
access=$(awk '{print $9}' access.log | wc -l)
echo "Total Requests: $access"
#Exporting to csv
echo "," >> "$log_csv"
echo "Total Requests:,$access" >> "$log_csv"

# Iterate over error codes and compute error rate for each one
for code in "${!error_codes[@]}"; do
    # Count the number of occurrences of the error code
    count=$(awk -v code=${error_codes[$code]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        # Compute the error rate and print the results
        error_rate=$(awk "BEGIN { printf \"%.4f\", $count * 100 / $access }")
        echo "Number of $code error found: $count"
        #Exporting to csv
        echo "Number of $code error found:,$count" >> "$log_csv"

        echo "Percentage of $code: $error_rate%"
        #Exporting to csv
        echo "Percentage of $code:,$error_rate%" >> "$log_csv"
    else
        echo "test"
    fi
done