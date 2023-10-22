import random
import datetime

# List of HTTP methods and response codes
http_methods = ["GET", "POST", "PUT", "DELETE", "HEAD"]
response_codes = [200, 302, 304, 400, 404, 500]

# List of user agents
user_agents = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.0.0 Safari/537.36",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15A372 Safari/604.1",
    "curl/7.68.0",
]

# Generate 100 log entries
for _ in range(1000):
    ip_address = "127.0.0.1"
    date = datetime.datetime.now().strftime("%d/%b/%Y:%H:%M:%S %z")
    http_method = random.choice(http_methods)
    path = "/" + "".join(random.choices("abcdefghijklmnopqrstuvwxyz", k=random.randint(5, 15))) + ".html"
    http_version = "HTTP/1.1"
    response_code = random.choice(response_codes)
    response_size = random.randint(0, 1024)
    referer = "https://example.com"
    user_agent = random.choice(user_agents)

    log_entry = f'{ip_address} - - [{date}] "{http_method} {path} {http_version}" {response_code} {response_size} "{referer}" "{user_agent}"'
    print(log_entry)
