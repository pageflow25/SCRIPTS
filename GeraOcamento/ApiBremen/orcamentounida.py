import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5qRTNNVEEzTjMwLkZqTXBhbUVUcExDbEFyVmNMUG16M1Nkemk0ZVVKMjA2OW1XWF9QaHF2TzA=",
 "Content-Type": "application/json"
}

payload = json.dumps(
 {
    "identifier": "PageFlow",
    "data": {
        "id_cliente": 2156,
        "id_vendedor": 3,
        "id_forma_pagamento": "4",
        "itens": [
            {
                "id_produto": 86,
                "descricao": "planner_pensarconcursos_2026_azul (#366)",
                "quantidade": 4,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 222,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Capa",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [
                            {
                                "tipo": "Opções",
                                "pergunta": "Laminação ?",
                                "resposta": "Frente",
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
                        "id": 223,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Miolo",
                        "quantidade_paginas": 465,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 224,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 225,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Wire-o?",
                        "resposta": "Preto",
                        "id_pergunta": 22
                    },
                    {
                        "tipo": "Opções",
                        "pergunta": "Borda de Encadernação?",
                        "resposta": "Borda Maior",
                        "id_pergunta": 37
                    }
                ]
            },
            {
                "id_produto": 86,
                "descricao": "planner_pensarconcursos_2026_preto (#366)",
                "quantidade": 5,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 222,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Capa",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [
                            {
                                "tipo": "Opções",
                                "pergunta": "Laminação ?",
                                "resposta": "Frente",
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
                        "id": 223,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Miolo",
                        "quantidade_paginas": 466,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 224,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 225,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Wire-o?",
                        "resposta": "Preto",
                        "id_pergunta": 22
                    },
                    {
                        "tipo": "Opções",
                        "pergunta": "Borda de Encadernação?",
                        "resposta": "Borda Maior",
                        "id_pergunta": 37
                    }
                ]
            },
            {
                "id_produto": 86,
                "descricao": "planner_pensarconcursos_2026_bordo (#366)",
                "quantidade": 7,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 222,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Capa",
                        "quantidade_paginas": 1,
                        "perguntas_componente": [
                            {
                                "tipo": "Opções",
                                "pergunta": "Laminação ?",
                                "resposta": "Frente",
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
                        "id": 223,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Miolo",
                        "quantidade_paginas": 466,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 224,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 225,
                        "altura": 21.00,
                        "largura": 14.80,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Wire-o?",
                        "resposta": "Preto",
                        "id_pergunta": 22
                    },
                    {
                        "tipo": "Opções",
                        "pergunta": "Borda de Encadernação?",
                        "resposta": "Borda Maior",
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