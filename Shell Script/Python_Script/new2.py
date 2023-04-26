import csv
import re

method_counts = {"GET": {}, "POST": {}, "HEAD": {}, "OPTIONS":{}, "PUT":{}, "DELETE":{}, "PATCH": {}}

with open("access.log") as f:
    for line in f:
        match = re.search(r'(\d+\.\d+\.\d+\.\d+)\s-\s-\s\[(.*?)\]\s"(GET|POST|HEAD|OPTIONS|PUT|DELETE|PATCH)\s(.*?)\sHTTP/1\.\d"\s(\d+)\s', line)
        if match:
            ip, timestamp, method, path, status_code = match.groups()
            if method in method_counts:
                if status_code not in method_counts[method]:
                    method_counts[method][status_code] = 1
                else:
                    method_counts[method][status_code] += 1

with open("http_status_counts.csv", mode="w") as f:
    writer = csv.writer(f)
    writer.writerow(["Method", "Status Code", "Count"])
    for method, counts in method_counts.items():
        for status_code, count in counts.items():
            writer.writerow([method, status_code, count])