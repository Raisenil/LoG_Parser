
import re
import csv

get_pattern = r'"GET (.*?) HTTP'
post_pattern = r'"POST (.*?) HTTP'
head_pattern = r'"HEAD (.*?) HTTP'
time_pattern = r'\[.*\]'
status_pattern = r'HTTP/\d\.\d" (\d{3})'

data = {}

with open('access/access.log') as file:
    for line in file:
        time = re.findall(time_pattern, line)[0]
        get_match = re.findall(get_pattern, line)
        post_match = re.findall(post_pattern, line)
        head_match = re.findall(head_pattern, line)
        status_match = re.findall(status_pattern, line)

        if get_match:
            url = get_match[0]
            if url not in data:
                data[url] = {'GET': 0, 'POST': 0, 'HEAD': 0}
            data[url]['GET'] += 1
        elif post_match:
            url = post_match[0]
            if url not in data:
                data[url] = {'GET': 0, 'POST': 0, 'HEAD': 0}
            data[url]['POST'] += 1
        elif head_match:
            url = head_match[0]
            if url not in data:
                data[url] = {'GET': 0, 'POST': 0, 'HEAD': 0}
            data[url]['HEAD'] += 1

        if status_match:
            status_code = status_match[0]
            if status_code not in data:
                data[status_code] = 0
            data[status_code] += 1

# Sorting the data by status codes
sorted_data = sorted(data.items(), key=lambda x: x[0])

# Writing to a CSV file
with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['URL/Status Code', 'GET', 'POST', 'HEAD', 'Count'])
    for key, value in sorted_data:
        if isinstance(value, dict):
            row = [key, value['GET'], value['POST'], value['HEAD'], sum(value.values())]
        else:
            row = [key, '', '', '', value]
        writer.writerow(row)
