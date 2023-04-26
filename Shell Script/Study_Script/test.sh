#!/bin/sh

# All Error Codes - 301 304 401 403 404 405 501 502 503 504

### Total Access Number ###

numberofaccess=( $(awk '{print $9}' "access.log" | sort | uniq -c | sort -rn | awk '{print $1}') )
access=0
for numberofaccess in "${numberofaccess[@]}"
do
    access=$(expr "$numberofaccess" + $access)
done
echo "Total Requests : $access"


### 301 error ######

## 301 error amount ##

numberofaccess301=( $(awk '($9 ~ /301/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_301=0

for numberofaccess301 in "${numberofaccess301[@]}"
do
    error_301=$(expr "$numberofaccess301" + $error_301)
done

if [ $error_301 -eq 0 ]
then
    continue
else
## 301 error rate ##
    echo "Number of 301 error found : $error_301"
    errorpercentagefor301=$(awk "BEGIN { printf \"%.4f\", $error_301 * 100 / $access }")
    echo "percentage of 301 : $errorpercentagefor301%"
fi


### 304 error ######

## 304 error amount ##

numberofaccess304=( $(awk '($9 ~ /304/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_304=0

for numberofaccess304 in "${numberofaccess304[@]}"
do
    error_304=$(expr "$numberofaccess304" + $error_304)
done

if [ $error_304 -eq 0 ]
then
    continue
else
## 304 error rate ##
    echo "Number of 304 error found : $error_304"
    errorpercentagefor304=$(awk "BEGIN { printf \"%.4f\", $error_304 * 100 / $access }")
    echo "percentage of 304 : $errorpercentagefor304%"
fi


### 401 error ######

## 401 error amount ##

numberofaccess401=( $(awk '($9 ~ /401/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_401=0

for numberofaccess401 in "${numberofaccess401[@]}"
do
    error_401=$(expr "$numberofaccess401" + $error_401)
done

if [ $error_401 -eq 0 ]
then
    continue
else
## 401 error rate ##
    echo "Number of 401 error found : $error_401"
    errorpercentagefor401=$(awk "BEGIN { printf \"%.4f\", $error_401 * 100 / $access }")
    echo "percentage of 401 : $errorpercentagefor401%"
fi


### 403 error ######

## 403 error amount ##

numberofaccess403=( $(awk '($9 ~ /403/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_403=0

for numberofaccess403 in "${numberofaccess403[@]}"
do
    error_403=$(expr "$numberofaccess403" + $error_403)
done

if [ $error_403 -eq 0 ]
then
    continue
else
## 403 error rate ##
    echo "Number of 403 error found : $error_403"
    errorpercentagefor403=$(awk "BEGIN { printf \"%.4f\", $error_403 * 100 / $access }")
    echo "percentage of 403 : $errorpercentagefor403%"
fi


### 404 error ######

## 404 error amount ##
numberofaccess404=( $(awk '($9 ~ /404/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_404=0

for numberofaccess404 in "${numberofaccess404[@]}"
do
    error_404=$(expr "$numberofaccess404" + $error_404)
done

if [ $error_404 -eq 0 ]
then
    continue
else
## 404 error rate ##
    echo "Number of 404 error found : $error_404"
    errorpercentagefor404=$(awk "BEGIN { printf \"%.4f\", $error_404 * 100 / $access }")
    echo "percentage of 404 : $errorpercentagefor404%"
fi


### 405 error ######

## 405 error amount ##
numberofaccess405=( $(awk '($9 ~ /405/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_405=0

for numberofaccess405 in "${numberofaccess405[@]}"
do
    error_405=$(expr "$numberofaccess405" + $error_405)
done

if [ $error_405 -eq 0 ]
then
    continue
else
## 405 error rate ##
    echo "Number of 405 error found : $error_405"
    errorpercentagefor405=$(awk "BEGIN { printf \"%.4f\", $error_405 * 100 / $access }")
    echo "percentage of 405 : $errorpercentagefor405%"
fi


### 501 error ######

## 501 error amount ##
numberofaccess501=( $(awk '($9 ~ /501/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_501=0

for numberofaccess501 in "${numberofaccess501[@]}"
do
    error_501=$(expr "$numberofaccess501" + $error_501)
done

if [ $error_501 -eq 0 ]
then
    continue
else
## 501 error rate ##
    echo "Number of 501 error found : $error_501"
    errorpercentagefor501=$(awk "BEGIN { printf \"%.4f\", $error_501 * 100 / $access }")
    echo "percentage of 501 : $errorpercentagefor501%"
fi


### 502 error ######

## 502 error amount ##
numberofaccess502=( $(awk '($9 ~ /502/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_502=0

for numberofaccess502 in "${numberofaccess502[@]}"
do
    error_502=$(expr "$numberofaccess502" + $error_502)
done

if [ $error_502 -eq 0 ]
then
    continue
else
## 502 error rate ##
    echo "Number of 502 error found : $error_502"
    errorpercentagefor502=$(awk "BEGIN { printf \"%.4f\", $error_502 * 100 / $access }")
    echo "percentage of 502 : $errorpercentagefor502%"
fi


### 503 error ######

## 503 error amount ##
numberofaccess503=( $(awk '($9 ~ /503/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_503=0

for numberofaccess503 in "${numberofaccess503[@]}"
do
    error_503=$(expr "$numberofaccess503" + $error_503)
done

if [ $error_503 -eq 0 ]
then
    continue
else
## 503 error rate ##
    echo "Number of 503 error found : $error_503"
    errorpercentagefor503=$(awk "BEGIN { printf \"%.4f\", $error_503 * 100 / $access }")
    echo "percentage of 503 : $errorpercentagefor503%"
fi


### 504 error ######

## 504 error amount ##
numberofaccess504=( $(awk '($9 ~ /504/)' "access.log" | awk '{print $7}' | sort | uniq -c | sort -rn | awk '{print $1}') )

error_504=0

for numberofaccess504 in "${numberofaccess504[@]}"
do
    error_504=$(expr "$numberofaccess504" + $error_504)
done

if [ $error_504 -eq 0 ]
then
    continue
else
## 504 error rate ##
    echo "Number of 504 error found : $error_504"
    errorpercentagefor504=$(awk "BEGIN { printf \"%.4f\", $error_504 * 100 / $access }")
    echo "percentage of 504 : $errorpercentagefor504%"
fi


# echo "Dont touch it if it runs properly"
# #awk '{print $9}' "access.log" | sort | uniq -c | sort -rn

# ### Check if Linux server have mail server
# if command -v sendmail >/dev/null 2>&1 ; then
#     echo "Mail server is available."
# else
#     echo "Mail server is not available."
# fi