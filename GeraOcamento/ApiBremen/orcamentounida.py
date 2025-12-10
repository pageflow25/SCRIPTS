import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UTTRNVGs0TlgwLmNrbG52YjNPcHRTTVBGRFJLZWE5d01KMXJhczFSYmlHbGY2OHppdUl2R0U=",
 "Content-Type": "application/json"
}

payload = json.dumps(
{
    "identifier": "PageFlow",
    "data": {
        "id_cliente": 166,
        "id_vendedor": 3,
        "id_forma_pagamento": "1",
        "itens": [
            {
                "id_produto": 150,
                "descricao": "0002-a_apostila_aluno-regular_4aetapa-2025_inf-5",
                "quantidade": 40,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 356,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Capa",
                        "quantidade_paginas": 135,
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
                        "id": 357,
                        "altura": 14.80,
                        "largura": 10.50,
                        "descricao": "Miolo da Apostila",
                        "quantidade_paginas": 117,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Colorido",
                        "id_pergunta": 22
                    },
                    {
                        "tipo": "Opções",
                        "pergunta": "Borda de Encadernação?",
                        "resposta": "Borda Menor",
                        "id_pergunta": 37
                    }
                ]
            }
        ]
    }
}
)

response = requests.request("POST", reqUrl, data=payload,  headers=headersList)

print(response.text)