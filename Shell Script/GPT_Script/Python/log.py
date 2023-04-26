#!/usr/bin/env python3
import os
import glob
from datetime import datetime


# Define error codes and their corresponding HTTP status codes
error_codes = {"100": 100, "101": 101, "102": 102, "200": 200, "201": 201, "202": 202, "203": 203, "204": 204, "205": 205, "206": 206, "300": 300, "301": 301, "302": 302, "303": 303, "304": 304, "305": 305, "307": 307, "308": 308, "400": 400, "401": 401, "402": 402, "403": 403, "404": 404, "405": 405, "406": 406, "407": 407, "408": 408, "409": 409, "410": 410, "411": 411, "412": 412, "413": 413, "414": 414, "415": 415, "416": 416, "417": 417, "418": 418, "421": 421, "422": 422, "423": 423, "424": 424, "426": 426, "428": 428, "429": 429, "431": 431, "444": 444, "451": 451, "499": 499, "500": 500, "501": 501, "502": 502, "503": 503, "504": 504, "505": 505, "506": 506, "507": 507, "508": 508, "510": 510, "511": 511, "599": 599}



# Define the pattern for matching log files
log_file_pattern = "*_log.csv"

# Find all matching log files
log_files = glob.glob(log_file_pattern)

# Check if any log files exist
if log_files:
# Delete all matching log files
    for log_file in log_files:
        os.remove(log_file)
    print(f"{len(log_files)} old record file(s) deleted.")
else:
    print("No record files found.")


# creating CSV Named Date_Time_log.csv
log_date = f"{os.getlogin()}_{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}_log"
log_csv = f"{log_date}.csv"
with open(log_csv, "w") as f:
    f.write("Timestamp,Request_Name,Status,Count\n")

# Parse the log file and compute total number of requests
with open("access.log", "r") as f:
    access = sum(1 for line in f)

timestamp = datetime.now().strftime('%Y-%m-%d_%H:%M:%S')

for code in error_codes:
# Count the number of occurrences of the error code
    with open("access.log", "r") as f:
        count = sum(1 for line in f if line.split()[8] == str(error_codes[code]))

if count > 0:
    with open(log_csv, "a") as f:
        request_names = [line.split()[5] for line in open("access.log", "r") if line.split()[8] == str(error_codes[code])]
        request_names_counts = [[request_names.count(name), name] for name in set(request_names)]
        request_names_counts_sorted = sorted(request_names_counts, reverse=True)
for count, name in request_names_counts_sorted:
    f.write(f"{timestamp}, {name}, {code}, {count}\n")

with open(log_csv, "a") as f:
    f.write("\nTotal Request,,,{}\n".format(access))
print("New Record Created")