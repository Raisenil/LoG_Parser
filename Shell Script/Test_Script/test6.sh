#!/bin/bash
# Declare an empty array
my_array=()

# Use command substitution to capture the output of the awk command
output=$(awk '{if ($9 != "-" && ($6 ~ /OPTIONS/ || $6 ~ /GET/ || $6 ~ /HEAD/ || $6 ~ /PUT/ || $6 ~ /POST/ || $6 ~ /DELETE/ || $6 ~ /PATCH/)) {print $9}}' access.log | sort | uniq)

# Use mapfile to read each line of output into the array
mapfile -t error_codes <<< "$output"

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
#echo "Total Requests: $access"

timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

length=${#error_codes[@]}  # get length of array

for ((i=0; i<$((length)); i++)); do  # loop over first n-1 elements
    code=${error_codes[$i]}
    count=$(awk -v code=${error_codes[$i]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        request_name=$(awk -v code=${error_codes[$i]} '$9 == code {print $6}' access.log | sort | uniq -c | sort -rn)
        echo $timestamp ,$request_name ,$code ,$count >> "$log_csv"
    fi
done

echo " , " >> "$log_csv"
echo "Total Request : , , , $access" >> "$log_csv"
echo "New Record Created"
