import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/orcamento"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5qQTJPVGM1Tm4wLjFZbzN3dzdHU0xDeTZpNkQzME9sd0NkVVZtb3JFVDBFQmRFX19iRzBmdlE=",
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
                "id_produto": 107,
                "descricao": "capa_alerj - (#365) - MEMOREX 07",
                "quantidade": 1,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 153,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa - (#365) - MEMOREX 07",
                "quantidade": 1,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 131,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa_-_informatica - (#365) - MEMOREX 07",
                "quantidade": 1,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 91,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa_-_lingua_port. - (#365) - MEMOREX 07",
                "quantidade": 1,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 85,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa_pp_mg - (#365) - MEMOREX 07",
                "quantidade": 2,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 201,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa_-_redacao - (#365) - MEMOREX 07",
                "quantidade": 3,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 35,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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
                "id_produto": 107,
                "descricao": "capa_tj_rj_analista_judiciario - (#365) - MEMOREX 07",
                "quantidade": 1,
                "usar_listapreco": 1,
                "manter_estrutura_mod_produto": 1,
                "componentes": [
                    {
                        "id": 274,
                        "altura": 29.70,
                        "largura": 21.00,
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
                        "id": 275,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Miolo",
                        "quantidade_paginas": 210,
                        "perguntas_componente": [],
                        "gramaturasubstratoimpressao": 75.00
                    },
                    {
                        "id": 276,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Papelão",
                        "perguntas_componente": []
                    },
                    {
                        "id": 277,
                        "altura": 29.70,
                        "largura": 21.00,
                        "descricao": "Guarda",
                        "perguntas_componente": []
                    }
                ],
                "perguntas_gerais": [
                    {
                        "tipo": "Opções",
                        "pergunta": "Cor do Espiral?",
                        "resposta": "Preto",
                        "id_pergunta": 21
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