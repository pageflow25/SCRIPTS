import requests
import json

url = "http://192.168.1.10:9001/api/v1/auth"

headers = {
    "Content-Type": "application/json"
}

payload = {
    "identifier": "pageflow",
    "data": {
        "user": "pageflow",
        "password": "2MGlFFE59SNXNNI8q9t9wU"
    }
}

def get_token():
    try:
        response = requests.post(url, json=payload, headers=headers, timeout=10)
        response.raise_for_status()
        return response.json()

    except requests.exceptions.RequestException as e:
        # Return the exception so callers can inspect/print it
        return {"error": str(e)}


if __name__ == "__main__":
    result = get_token()
    if isinstance(result, dict) and result.get("error"):
        print("Erro ao gerar token:")
        print(result["error"])
    else:
        print("Token gerado com sucesso:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
