import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UVTFOakkwTm4wLjhleDBOSTZ6VTdEVUgxbGhOcFRTYWFXcG9EQ2ZQQnA1R0U1UmJlNERRNHc=",
 "Content-Type": "application/json"
}

payload = json.dumps
(
    {
        "identifier": "PageFlow",
        "data": {
            "id_cliente": 2,
            "id_vendedor": 3,
            "id_forma_pagamento": "1",
            "itens": [
                {
                    "id_produto": 178,
                    "descricao": "processo_automacao_distribuicao_materiais (#349)",
                    "quantidade": 4,
                    "usar_listapreco": 1,
                    "manter_estrutura_mod_produto": 1,
                    "componentes": [
                        {
                            "id": 424,
                            "altura": 14.80,
                            "largura": 21.00,
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
                                    "resposta": "Fosco",
                                    "id_pergunta": 4
                                }
                            ]
                        },
                        {
                            "id": 425,
                            "altura": 14.80,
                            "largura": 21.00,
                            "descricao": "Miolo",
                            "quantidade_paginas": 2,
                            "perguntas_componente": [],
                            "gramaturasubstratoimpressao": 90.00
                        }
                    ],
                    "perguntas_gerais": [
                        {
                            "tipo": "Opções",
                            "pergunta": "Orelha ?",
                            "resposta": "Com Orelha",
                            "id_pergunta": 36
                        }
                    ]
                }
            ]
        }
    }
)

response = requests.request("POST", reqUrl, data=payload,  headers=headersList)

print(response.text)