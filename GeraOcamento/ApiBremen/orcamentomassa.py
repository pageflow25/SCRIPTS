import requests
import json
import time
import sys

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
	"Accept": "*/*",
	"Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5USTVPRFUyTUgwLnlYZW5wZ1JLODBXdWFJNUtBbFFsUkc1ZllVRGdSbXotYmJlOUxORVd3TU0=",
	"Content-Type": "application/json",
}

payload = json.dumps(
	{
    "identifier": "PageFlow",
    "data": {
        "id_cliente": 2,
        "id_vendedor": 3,
        "id_forma_pagamento": "1",
        "itens": [
            {
                "id_produto": 177,
                "descricao": "0002-a_apostila_aluno-regular_4aetapa-2025_inf-5",
                "quantidade": 10,
                "componentes": [
                    {
                        "id": 423,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 135,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    }
                ],
                "perguntas_gerais": []
            }
        ]
    }
}
)


TOTAL_REQUESTS = 500
# Number of additional retries after the first attempt (so total attempts = 1 + MAX_RETRIES)
MAX_RETRIES = 2
TIMEOUT = None  # seconds for each request; set to None for no timeout so next request starts immediately on success


def send_requests(total=TOTAL_REQUESTS, max_retries=MAX_RETRIES):
    session = requests.Session()

    for i in range(1, total + 1):
        attempt = 0
        start_time = time.perf_counter()
        while True:
            try:
                # build kwargs so we only pass timeout if it's set
                kwargs = {"data": payload, "headers": headersList}
                if TIMEOUT is not None:
                    kwargs["timeout"] = TIMEOUT
                resp = session.post(reqUrl, **kwargs)
                resp.raise_for_status()
                elapsed = time.perf_counter() - start_time
                print(f"[{i}/{total}] Success (attempt {attempt + 1}) - status: {resp.status_code} - elapsed: {elapsed:.3f}s")
                # If you want to see the response body, uncomment the next line (may be large).
                # print(resp.text)
                break
            except requests.RequestException as e:
                attempt += 1
                if attempt <= max_retries:
                    wait = min(5, 1.5 ** attempt)
                    print(f"[{i}/{total}] Attempt {attempt} failed: {e}. Retrying in {wait:.1f}s...")
                    time.sleep(wait)
                    continue
                else:
                    elapsed = time.perf_counter() - start_time
                    print(f"[{i}/{total}] Failed after {attempt} attempts: {e} - elapsed: {elapsed:.3f}s")
                    break


if __name__ == "__main__":
	try:
		send_requests()
	except KeyboardInterrupt:
		print("Interrupted by user", file=sys.stderr)