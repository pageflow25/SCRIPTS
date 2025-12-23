import requests
import json

from sqlalchemy import true

reqUrl = "http://192.168.1.10:9001/api/v1/proposta/aprovar"

headersList = {
    "Accept": "*/*",
    "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5qRTNNVEEzTjMwLkZqTXBhbUVUcExDbEFyVmNMUG16M1Nkemk0ZVVKMjA2OW1XWF9QaHF2TzA=",
    "Content-Type": "application/json"
}

payload = {
    "identifier": "PageFlow",

    "data": {
        "id_orcamento": 1379,
        "gerar_op": True,
        "itens": [
            {
                "id": 20178,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"

            },
            {
                "id": 20179,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20180,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            }
        ]
    }
}

response = requests.post(reqUrl, json=payload, headers=headersList)

print(response.status_code)
print(response.text)
