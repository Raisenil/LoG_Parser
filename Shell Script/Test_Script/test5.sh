#!/bin/bash

# Define error codes and their corresponding HTTP status codes
declare -A error_codes=(
    [100]=100
    [101]=101
    [102]=102
    [200]=200
    [201]=201
    [202]=202
    [203]=203
    [204]=204
    [205]=205
    [206]=206
    [207]=207
    [208]=208
    [226]=226
    [300]=300
    [301]=301
    [302]=302
    [303]=303
    [304]=304
    [305]=305
    [307]=307
    [308]=308
    [400]=400
    [401]=401
    [402]=402
    [403]=403
    [404]=404
    [405]=405
    [406]=406
    [407]=407
    [408]=408
    [409]=409
    [410]=410
    [411]=411
    [412]=412
    [413]=413
    [414]=414
    [415]=415
    [416]=416
    [417]=417
    [418]=418
    [421]=421
    [422]=422
    [423]=423
    [424]=424
    [426]=426
    [428]=428
    [429]=429
    [431]=431
    [444]=444
    [451]=451
    [499]=499
    [500]=500
    [501]=501
    [502]=502
    [503]=503
    [504]=504
    [505]=505
    [506]=506
    [507]=507
    [508]=508
    [510]=510
    [511]=511
    [599]=599
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
#echo "Total Requests: $access"

timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

for code in "${!error_codes[@]}"; do
    # Count the number of occurrences of the error code
    count=$(awk -v code=${error_codes[$code]} '$9 == code { count++ } END { print count }' access.log)
    if [[ $count -gt 0 ]]; then
        request_name=$(awk -v code=${error_codes[$code]} '$9 == code {print $6}' access.log | sort | uniq -c | sort -rn)
        echo $timestamp ,$request_name ,$code ,$count >> "$log_csv"
    fi
done

echo " , " >> "$log_csv"
echo "Total Request : , , , $access" >> "$log_csv"
echo "New Record Created"