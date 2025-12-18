import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/proposta/aprovar"

headersList = {
    "Accept": "*/*",
    "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5qQTJPVGM1Tm4wLjFZbzN3dzdHU0xDeTZpNkQzME9sd0NkVVZtb3JFVDBFQmRFX19iRzBmdlE=",
    "Content-Type": "application/json"
}

payload = {
    "identifier": "PageFlow",
    "data": {
        "id_orcamento": 1365,
        "gerar_op": True,

        "itens": [
            {
                "id": 20115,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20116,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20117,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20118,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20119,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20120,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            },
            {
                "id": 20121,
                "data_entrega": "2025-12-24T12:00:00.000-03:00"
            }
        ]
    }
}

response = requests.post(reqUrl, json=payload, headers=headersList)

print(response.status_code)
print(response.text)
