#!/bin/bash

declare -A method_counts=(
  ["GET"]=""
  ["POST"]=""
  ["HEAD"]=""
  ["OPTIONS"]=""
  ["PUT"]=""
  ["DELETE"]=""
  ["PATCH"]=""
)

while read -r line; do
  if [[ $line =~ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\s-\s-\s\[(.*?)\]\s\"(GET|POST|HEAD|OPTIONS|PUT|DELETE|PATCH)\s(.*?)\sHTTP/1\.[0-1]\"\s([0-9]+)\s ]]; then
    ip=${BASH_REMATCH[1]}
    timestamp=${BASH_REMATCH[2]}
    method=${BASH_REMATCH[3]}
    path=${BASH_REMATCH[4]}
    status_code=${BASH_REMATCH[5]}

    if [[ ${method_counts[$method]} ]]; then
      if [[ ${method_counts[$method][$status_code]} ]]; then
        ((method_counts[$method][$status_code]++))
      else
        method_counts[$method][$status_code]=1
      fi
    fi
  fi
done < access.log

echo "Method,Status Code,Count" > http_status_counts.csv

for method in "${!method_counts[@]}"; do
  for status_code in "${!method_counts[$method]}"; do
    count=${method_counts[$method][$status_code]}
    echo "${method},${status_code},${count}" >> http_status_counts.csv
  done
done
