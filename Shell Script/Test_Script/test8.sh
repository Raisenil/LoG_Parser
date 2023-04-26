#!/bin/bash
my_array=()

output=$(awk '{if ($9 != "-" && ($6 ~ /OPTIONS/ || $6 ~ /GET/ || $6 ~ /HEAD/ || $6 ~ /PUT/ || $6 ~ /POST/ || $6 ~ /DELETE/ || $6 ~ /PATCH/)) {print $9}}' access.log | sort | uniq)

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
access=$(awk '{if ($9 != "-" && ($6 ~ /OPTIONS/ || $6 ~ /GET/ || $6 ~ /HEAD/ || $6 ~ /PUT/ || $6 ~ /POST/ || $6 ~ /DELETE/ || $6 ~ /PATCH/)) {print $9}}' access.log | sort | uniq -c | awk '{print $1}' | awk '{s+=$1} END {print s}'
)
#echo "Total Requests: $access"

timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

length=${#error_codes[@]} 

for ((i=0; i<$((length)); i++)); do 
    code=${error_codes[$i]}
    count=$(awk -v code=${error_codes[$i]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        # echo $count
        request_name_OPTIONS=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /OPTIONS/ {print $6}' access.log | sort | uniq -c | sort -rn)
        request_name_GET=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /GET/ {print $6}' access.log | sort | uniq | sort -rn)
        request_name_HEAD=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /HEAD/ {print $6}' access.log | sort | uniq | sort -rn)
        request_name_PUT=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /PUT/ {print $6}' access.log | sort | uniq | sort -rn)
        request_name_POST=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /POST/ {print $6}' access.log | sort | uniq | sort -rn)
        request_name_DELETE=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /DELETE/ {print $6}' access.log | sort | uniq | sort -rn)
        request_name_PATCH=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /PATCH/ {print $6}' access.log | sort | uniq | sort -rn)
        if [ -n "$request_name_OPTIONS" ]; then
                    request_name_OPTIONS="OPTIONS"
                    count_OPTIONS=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /OPTIONS/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}' )
                    echo $timestamp ,$request_name_OPTIONS ,$code ,$count_OPTIONS
                    echo $timestamp ,$request_name_OPTIONS ,$code ,$count_OPTIONS >> "$log_csv"
                fi
                if [ -n "$request_name_GET" ]; then
                    request_name_GET="GET"
                    count_GET=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /GET/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_GET ,$code ,$count_GET
                    echo $timestamp ,$request_name_GET ,$code ,$count_GET >> "$log_csv"
                fi
                if [ -n "$request_name_HEAD" ]; then
                    request_name_HEAD="HEAD"
                    count_HEAD=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /HEAD/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_HEAD ,$code ,$count_HEAD
                    echo $timestamp ,$request_name_HEAD ,$code ,$count_HEAD >> "$log_csv"
                fi
                if [ -n "$request_name_PUT" ]; then
                    request_name_PUT="PUT"
                    count_PUT=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /PUT/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_PUT ,$code ,$count_PUT
                    echo $timestamp ,$request_name_PUT ,$code ,$count_PUT >> "$log_csv"
                fi
                if [ -n "$request_name_POST" ]; then
                    request_name_POST="POST"
                    count_POST=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /POST/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_POST ,$code ,$count_POST
                    echo $timestamp ,$request_name_POST ,$code ,$count_POST >> "$log_csv"
                fi
                if [ -n "$request_name_DELETE" ]; then
                    request_name_DELETE="DELETE"
                    count_DELETE=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /DELETE/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_DELETE ,$code ,$count_DELETE
                    echo $timestamp ,$request_name_DELETE ,$code ,$count_DELETE >> "$log_csv"
                fi
                if [ -n "$request_name_PATCH" ]; then
                    request_name_PATCH="PATCH"
                    count_PATCH=$(awk -v code=${error_codes[$i]} '$9 == code && $6 ~ /PATCH/ {print $6}' access.log | sort | uniq -c | sort -rn | awk '{print $1}')
                    echo $timestamp ,$request_name_PATCH ,$code ,$count_PATCH
                    echo $timestamp ,$request_name_PATCH ,$code ,$count_PATCH >> "$log_csv"
                fi
    fi
done

echo "," >> "$log_csv"
echo "Total Request : , , , $access" >> "$log_csv"
echo "New Record Created..."
