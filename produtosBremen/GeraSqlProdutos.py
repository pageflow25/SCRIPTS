import json

def format_value(value):
    """Trata valores para SQL: Strings com aspas simples, booleanos e Nones."""
    if value is None:
        return "NULL"
    if isinstance(value, str):
        escaped = value.replace("'", "''")
        return f"'{escaped}'"
    if isinstance(value, bool):
        return "true" if value else "false"
    return str(value)

def gerar_sql(json_file_path, output_sql_path):
    try:
        with open(json_file_path, 'r', encoding='utf-8') as f:
            data_list = json.load(f)
    except Exception as e:
        print(f"Erro ao ler JSON: {e}")
        return

    sql_statements = []
    
    # IMPORTANTE: Em alguns clients SQL, currval precisa estar na mesma transação.
    sql_statements.append("BEGIN;")

    print(f"Processando {len(data_list)} registros...")

    for entry in data_list:
        if 'caracteristicas' in entry and 'data' in entry['caracteristicas']:
            produtos = entry['caracteristicas']['data']
            
            for produto in produtos:
                # ---------------------------------------------------------
                # 1. PRODUTO (bremen_itens)
                # ---------------------------------------------------------
                prod_id = produto.get('id')
                prod_desc = format_value(produto.get('descricao'))
                
                sql_statements.append(f"""
                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), {prod_id}, {prod_desc}, '', '');
                """)

                # ---------------------------------------------------------
                # 2. COMPONENTES (bremen_componentes)
                # ---------------------------------------------------------
                componentes = produto.get('componentes') or []
                for comp in componentes:
                    comp_id = comp.get('id')
                    comp_desc_raw = comp.get('descricao', '')
                    comp_desc = format_value(comp_desc_raw)
                    
                    is_capa = "true" if "capa" in comp_desc_raw.lower() else "false"
                    is_miolo = "true" if "miolo" in comp_desc_raw.lower() else "false"

                    sql_statements.append(f"""
                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), {comp_id}, {comp_desc}, {prod_id}, {is_capa}, {is_miolo});
                    """)

                    # ---------------------------------------------------------
                    # 3. PERGUNTAS DO COMPONENTE
                    # ---------------------------------------------------------
                    perguntas_comp = comp.get('perguntas_componente') or []
                    for perg in perguntas_comp:
                        p_id = perg.get('id_pergunta')
                        p_nome = format_value(perg.get('pergunta'))
                        p_tipo = format_value(perg.get('tipo'))
                        
                        # Inserimos a PERGUNTA (Isso incrementa a sequence bremen_perguntas_id_seq)
                        sql_statements.append(f"""
                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), {comp_id}, {p_nome}, {p_tipo}, {p_id}, NULL);
                        """)

                        # 4. RESPOSTAS DO COMPONENTE
                        opcoes = perg.get('opcoes_resposta') or []
                        for opt in opcoes:
                            r_valor = format_value(opt.get('valor'))
                            r_desc = format_value(opt.get('descricao_opcao'))
                            
                            # TRUQUE AQUI: Usamos currval() para pegar o ID da pergunta recém criada
                            sql_statements.append(f"""
                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), {r_valor}, 0, {r_desc});
                            """)

                # ---------------------------------------------------------
                # 5. PERGUNTAS GERAIS (Vinculadas ao PRODUTO)
                # ---------------------------------------------------------
                perguntas_gerais = produto.get('perguntas_gerais') or []
                for perg in perguntas_gerais:
                    p_id = perg.get('id_pergunta')
                    p_nome = format_value(perg.get('pergunta'))
                    p_tipo = format_value(perg.get('tipo'))

                    # Inserimos a PERGUNTA (Isso incrementa a sequence bremen_perguntas_id_seq)
                    sql_statements.append(f"""
                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, {p_nome}, {p_tipo}, 0, {prod_id});
                    """)

                    # 6. RESPOSTAS GERAIS
                    opcoes = perg.get('opcoes_resposta') or []
                    for opt in opcoes:
                        r_valor = format_value(opt.get('valor'))
                        r_desc = format_value(opt.get('descricao_opcao'))

                        # TRUQUE AQUI: Usamos currval() novamente
                        sql_statements.append(f"""
                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), {r_valor}, 0, {r_desc});
                        """)

    sql_statements.append("COMMIT;")

    with open(output_sql_path, 'w', encoding='utf-8') as f:
        f.write("\n".join(sql_statements))
    
    print(f"Sucesso! Arquivo '{output_sql_path}' gerado com correção de currval().")

if __name__ == "__main__":
    gerar_sql('caracteristicas_produtos.json', 'insert_final_currval.sql')