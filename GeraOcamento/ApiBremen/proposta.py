import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/proposta/aprovar"

headersList = {
    "Accept": "*/*",
    "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UZ3dOak01TjMwLnlRTDZCRVF5RGVVczdLZFJkdW5nTzBRb3JEV3p6ZkxuYTRBTURGOFJDMjQ=",
    "Content-Type": "application/json"
}

payload = {
    "identifier": "PageFlow",
    "data": {
        "id_orcamento": 1131,
        "gerar_op": True,
        "itens": [
            {
                "id": 19619,
                "data_entrega": "2025-12-19T12:00:00.000-03:00"
            },
            {
                "id": 19620,
                "data_entrega": "2025-12-19T12:00:00.000-03:00"
            },
            {
                "id": 19621,
                "data_entrega": "2025-12-19T12:00:00.000-03:00"
            }
        ]
    }
}

response = requests.post(reqUrl, json=payload, headers=headersList)

print(response.status_code)
print(response.text)
