import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5ESTJPVFEyT1gwLkZOd1ZOQWVZUGNVdnFOQl9CV0FvSWVESnVFVEltRVc1R0VOTFF0cmh3bjA=",
 "Content-Type": "application/json"
}

payload = json.dumps(
    
)

response = requests.request("POST", reqUrl, data=payload,  headers=headersList)

print(response.text)