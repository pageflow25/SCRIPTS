import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UZ3dOak01TjMwLnlRTDZCRVF5RGVVczdLZFJkdW5nTzBRb3JEV3p6ZkxuYTRBTURGOFJDMjQ=",
 "Content-Type": "application/json"
}

payload = json.dumps(
{
    "identifier": "PageFlow",
    "data": {
        "id_cliente": 237,
        "id_vendedor": 3,
        "id_forma_pagamento": "1",
        "itens": [
            {
                "id_produto": 230,
                "descricao": "cr_grupo_salta_2026 (#357)",
                "quantidade": 9000,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 484,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    }
                ],
                "perguntas_gerais": []
            },
            {
                "id_produto": 228,
                "descricao": "cr_somatorio_2026 (#358)",
                "quantidade": 3000,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 482,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    }
                ],
                "perguntas_gerais": []
            },
            {
                "id_produto": 229,
                "descricao": "fr_grupo_salta_2026 (#359)",
                "quantidade": 11500,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 483,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 1,
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

response = requests.request("POST", reqUrl, data=payload,  headers=headersList)

print(response.text)