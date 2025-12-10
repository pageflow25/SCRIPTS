import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UUXdORGt4TUgwLjBVeW96UGxBZ2VxUmpiNXE4czc2eE9nWkdLOElQbFdIZEJRRXE2MDFubEE=",
 "Content-Type": "application/json"
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
                "id_produto": 91,
                "descricao": "0002-b_apostila_aluno-bilingue_4aetapa-2025_inf-5",
                "quantidade": 20,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 236,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Capa",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [
                            {
                                "tipo": "Opções",
                                "pergunta": "Laminação ?",
                                "resposta": "Frente/Verso",
                                "id_pergunta": 3
                            },
                            {
                                "tipo": "Opções",
                                "pergunta": "Tipo BOPP?",
                                "resposta": "Brilho",
                                "id_pergunta": 4
                            }
                        ]
                    },
                    {
                        "id": 237,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Miolo",
                        "quantidade_paginas": 117,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 246,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 247,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Guarda",
                        "perguntas_componente": []
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