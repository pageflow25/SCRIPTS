import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import psycopg2
import json
import os
from datetime import datetime

# --- CONFIGURAÇÃO DO BANCO DE DADOS ---
DB_CONFIG = {
    'host': 'aws-1-sa-east-1.pooler.supabase.com',
    'port': '6543',
    'dbname': 'postgres',
    'user': 'postgres.hrrxtytvaqyrjjonhann',
    'password': '0ffNxezYd5thvteQ',
    'sslmode': 'require'
}

# --- SQL 1: PARA MONTAR A ÁRVORE (VISUALIZAÇÃO) ---
SQL_HIERARQUIA = """
WITH dados_normalizados AS (
    SELECT
        COALESCE(uc.divisao_logistica, 'Sem divisão') AS divisao_logistica,
        COALESCE(CAST(uc.dias_uteis AS TEXT), 'Sem dias uteis') AS dias_uteis,
        b.id_produto,
        b.descricao AS nome_produto,
        COALESCE(TO_CHAR(CAST(distri.data_saida AS DATE), 'YYYY-MM-DD'), 'Sem data saida') AS data_saida_formatada,
        ar.id AS arquivo_id,
        ar.nome as nome_arquivo,
        distri.quantidade as quantidade,
        ar.paginas as paginas
    FROM formularios f
    INNER JOIN especificacoes_form e ON f.id = e.formulario_id
    INNER JOIN arquivo_pdfs ar ON ar.item_pedido_id = e.id
    INNER JOIN distribuicao_materiais distri ON distri.arquivo_pdf_id = ar.id
    INNER JOIN unidades_escolares uc ON distri.unidade_escolar_id = uc.id
    INNER JOIN bremen_itens b ON e.id_produto = b.id_produto
    WHERE UPPER(f.tipo_formulario) = UPPER('SALTA')
),
nivel_arquivos AS (
    SELECT
        divisao_logistica, dias_uteis, id_produto, nome_produto, data_saida_formatada,
        COUNT(*) AS qtd_arquivos,
        JSONB_AGG(JSONB_BUILD_OBJECT('arquivo', nome_arquivo, 'copias', quantidade, 'paginas', paginas) ORDER BY nome_arquivo ASC) AS lista_arquivos
    FROM dados_normalizados GROUP BY 1,2,3,4,5
),
nivel_datas AS (
    SELECT
        divisao_logistica, dias_uteis, id_produto, nome_produto,
        SUM(qtd_arquivos) AS qtd_produto,
        JSONB_AGG(JSONB_BUILD_OBJECT('data_saida', data_saida_formatada, 'quantidade', qtd_arquivos, 'arquivos', lista_arquivos) ORDER BY data_saida_formatada DESC) AS lista_datas
    FROM nivel_arquivos GROUP BY 1,2,3,4
),
nivel_produtos AS (
    SELECT
        divisao_logistica, dias_uteis,
        SUM(qtd_produto) AS qtd_divisao,
        JSONB_AGG(JSONB_BUILD_OBJECT('id_produto', id_produto, 'produto', nome_produto, 'quantidade', qtd_produto, 'datas', lista_datas) ORDER BY nome_produto ASC) AS lista_produtos
    FROM nivel_datas GROUP BY 1,2
),
nivel_divisoes AS (
    SELECT JSONB_BUILD_OBJECT('divisao_logistica', divisao_logistica, 'dias_uteis', dias_uteis, 'quantidade_total', qtd_divisao, 'produtos', lista_produtos) AS objeto_divisao
    FROM nivel_produtos ORDER BY divisao_logistica ASC
)
SELECT JSONB_AGG(objeto_divisao) FROM nivel_divisoes;
"""

# --- SQL 2: GERAÇÃO DO JSON DO ORÇAMENTO (SEU SQL COMPLEXO) ---
# Os placeholders {ids_produtos} e {datas_saida} serão substituídos pelo Python
SQL_ORCAMENTO_TEMPLATE = """
WITH parametros AS (
    SELECT
        15 AS escola_id,                 
        ARRAY[{ids_produtos}]::integer[] AS ids_produtos,
        ARRAY[{datas_saida}]::date[] AS datas_saida
),

unidades_filtradas AS (
    SELECT ue.id, ue.cliente_id, ue.forma_pagamento, ue.escola_id
    FROM unidades_escolares ue
    CROSS JOIN parametros p
    WHERE ue.escola_id = p.escola_id
),

especificacoes_unidade AS (
    SELECT DISTINCT
        uf.cliente_id, ef.id AS especificacao_id, ef.id_produto,
        COALESCE(bt.altura, NULLIF(ef.altura, '')::numeric) AS altura_mm,
        COALESCE(bt.largura, NULLIF(ef.largura, '')::numeric) AS largura_mm,
        NULLIF(ef.gramatura_miolo, '') AS gramatura_miolo,
        bg.gramatura AS gramatura_catalogo, bg.unidade_medida AS unidade_gramatura,
        dm.quantidade, dm.data_saida, ap.pares, ap.formulario_id,
        ap.nome AS arquivo_nome, ap.tipo_arquivo, ap.id_componente, ap.paginas, 
        bi.frente_verso, bi."categoria_Prod"
    FROM unidades_filtradas uf
    CROSS JOIN parametros p
    JOIN distribuicao_materiais dm ON dm.unidade_escolar_id = uf.id
    JOIN especificacoes_form ef ON ef.id = dm.especificacao_form_id
    LEFT JOIN bremen_gramatura bg ON bg.id = ef.id_gramatura
    LEFT JOIN bremen_tamanho_papel bt ON bt.id = ef.id_papel
    LEFT JOIN arquivo_pdfs ap ON ap.item_pedido_id = ef.id
    LEFT JOIN bremen_itens bi ON bi.id_produto = ef.id_produto 
    WHERE dm.quantidade > 0
        -- FILTRO DINÂMICO
        AND (p.ids_produtos IS NULL OR cardinality(p.ids_produtos) = 0 OR ef.id_produto = ANY(p.ids_produtos))
        AND (
            p.datas_saida IS NULL OR cardinality(p.datas_saida) = 0
            OR NULLIF(dm.data_saida, '')::date = ANY(p.datas_saida)
            OR NULLIF(dm.data_saida, '') IS NULL
        )
),

itens_produto AS (
    SELECT
        eu.cliente_id, 
        COALESCE(eu.pares::text, eu.especificacao_id::text) AS chave_agrupamento,
        eu.pares, eu.formulario_id, MAX(eu.especificacao_id) AS especificacao_id, MAX(eu.id_produto) AS id_produto,
        (
            COALESCE(
                MAX(CASE WHEN LOWER(eu.tipo_arquivo) = 'capa' THEN REPLACE(LOWER(eu.arquivo_nome), '.pdf', '') END),
                MAX(CASE WHEN LOWER(eu.tipo_arquivo) = 'miolo' THEN REPLACE(LOWER(eu.arquivo_nome), '.pdf', '') END),
                MAX(REPLACE(LOWER(eu.arquivo_nome), '.pdf', ''))
            ) || ' (#' || MAX(form.id) || ')'
        ) AS nome_arquivo,
        MAX(eu.altura_mm) AS altura, MAX(eu.largura_mm) AS largura, MAX(eu.gramatura_miolo) AS gramatura_miolo, MAX(eu.quantidade) AS quantidade_total,
        CASE
            WHEN (MAX(eu.paginas) > 2 AND UPPER(MAX(eu.frente_verso)) = 'FV' AND UPPER(MAX(eu."categoria_Prod")) = 'PROVA')
              OR (MAX(eu.paginas) > 1 AND UPPER(MAX(eu.frente_verso)) = 'SF' AND UPPER(MAX(eu."categoria_Prod")) = 'PROVA')
            THEN 'normal' ELSE 'separado'
        END AS tipo_agrupamento
    FROM especificacoes_unidade eu
    join formularios form on form.id = eu.formulario_id
    GROUP BY eu.cliente_id, COALESCE(eu.pares::text, eu.especificacao_id::text), eu.pares, eu.formulario_id
),

itens AS (
    SELECT DISTINCT
        eu.pares, eu.formulario_id, eu.especificacao_id, eu.id_produto, bi.descricao,
        eu.altura_mm, eu.largura_mm, eu.gramatura_miolo, eu.gramatura_catalogo, eu.unidade_gramatura
    FROM especificacoes_unidade eu
    JOIN bremen_itens bi ON bi.id_produto = eu.id_produto
),

componentes AS (
    SELECT DISTINCT
        i.pares, i.formulario_id, i.especificacao_id, i.id_produto,
        bc.id AS componente_id, bc.id_componente, bc.descricao,
        ROUND(i.altura_mm::numeric / 10, 2) AS altura, ROUND(i.largura_mm::numeric / 10, 2) AS largura,
        i.gramatura_miolo, i.gramatura_catalogo,
        CASE
            WHEN LOWER(COALESCE(bc.descricao, '')) LIKE '%capa%' THEN 1
            WHEN LOWER(COALESCE(bc.descricao, '')) LIKE '%miolo%' THEN (
                SELECT COALESCE(ap_pag.paginas, 0) FROM arquivo_pdfs ap_pag
                WHERE ap_pag.id_componente = bc.id_componente AND LOWER(COALESCE(ap_pag.tipo_arquivo, '')) = 'miolo'
                  AND ((i.pares IS NOT NULL AND ap_pag.pares = i.pares AND ap_pag.formulario_id = i.formulario_id) OR (i.pares IS NULL AND ap_pag.item_pedido_id = i.especificacao_id))
                ORDER BY ap_pag.criado_em DESC LIMIT 1
            )
            ELSE (
                SELECT ap_pag.paginas FROM arquivo_pdfs ap_pag
                WHERE ap_pag.id_componente = bc.id_componente
                  AND ((i.pares IS NOT NULL AND ap_pag.pares = i.pares AND ap_pag.formulario_id = i.formulario_id) OR (i.pares IS NULL AND ap_pag.item_pedido_id = i.especificacao_id))
                ORDER BY ap_pag.criado_em DESC LIMIT 1
            )
        END AS quantidade_paginas
    FROM itens i
    JOIN bremen_componentes bc ON bc.id_produto = i.id_produto
    LEFT JOIN arquivo_pdfs ap_sel ON ap_sel.item_pedido_id = i.especificacao_id AND ap_sel.id_componente = bc.id_componente
       AND ((i.pares IS NOT NULL AND ap_sel.pares = i.pares AND ap_sel.formulario_id = i.formulario_id) OR (i.pares IS NULL AND ap_sel.pares IS NULL AND (ap_sel.formulario_id = i.formulario_id OR ap_sel.formulario_id IS NULL)))
),

respostas_componentes AS (
    SELECT DISTINCT ON (c.especificacao_id, c.id_componente, bp.id)
        c.pares, c.formulario_id, c.especificacao_id, c.id_produto, c.id_componente, bp.id AS pergunta_id, br.descricao_opcao AS resposta
    FROM componentes c
    JOIN bremen_perguntas bp ON bp.id_componente = c.id_componente
    LEFT JOIN bremen_especificacao_detalhes bed ON bed.pergunta_id = bp.id AND bed.especificacao_id = c.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY c.especificacao_id, c.id_componente, bp.id
),

respostas_gerais AS (
    SELECT DISTINCT ON (i.especificacao_id, bp.id)
        i.pares, i.formulario_id, i.especificacao_id, i.id_produto, bp.id AS pergunta_id, br.descricao_opcao AS resposta
    FROM itens i
    JOIN bremen_perguntas bp ON bp.id_geral = i.id_produto
    LEFT JOIN bremen_especificacao_detalhes bed ON bed.pergunta_id = bp.id AND bed.especificacao_id = i.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY i.especificacao_id, bp.id
)

-- SQL FINAL
SELECT json_build_object(
    'identifier', 'PageFlow',
    'data', json_build_object(
        'id_cliente', ip.cliente_id, 
        'id_vendedor', 3,
        'id_forma_pagamento', '1',
        'itens', COALESCE(
            json_agg(
                json_build_object(
                    'id_produto', ip.id_produto,
                    'descricao', ip.nome_arquivo,
                    'quantidade', ip.quantidade_total,
                    'usar_listapreco', 1,
                    'manter_estrutura_mod_produto', 1,
                    'componentes', COALESCE((
                        SELECT json_agg(jsonb_strip_nulls(CASE WHEN LOWER(COALESCE(comp_sel.descricao, '')) LIKE '%miolo%' THEN jsonb_build_object('id', comp_sel.id_componente, 'descricao', comp_sel.descricao, 'altura', comp_sel.altura, 'largura', comp_sel.largura, 'quantidade_paginas', COALESCE(comp_sel.quantidade_paginas, 0), 'gramaturasubstratoimpressao', COALESCE(comp_sel.gramatura_catalogo, NULLIF(replace(regexp_replace(comp_sel.gramatura_miolo::text, '[^0-9.,]', '', 'g'), ',', '.'), '')::numeric), 'perguntas_componente', COALESCE((SELECT json_agg(json_build_object('id_pergunta', bp.id_pergunta, 'pergunta', bp.nome, 'tipo', bp.tipo, 'resposta', rc.resposta) ORDER BY bp.id_pergunta)::jsonb FROM bremen_perguntas bp INNER JOIN respostas_componentes rc ON rc.pergunta_id = bp.id AND rc.id_componente = comp_sel.id_componente AND rc.especificacao_id = comp_sel.especificacao_id WHERE bp.id_componente = comp_sel.id_componente), '[]'::jsonb)) ELSE jsonb_build_object('id', comp_sel.id_componente, 'descricao', comp_sel.descricao, 'altura', comp_sel.altura, 'largura', comp_sel.largura, 'quantidade_paginas', comp_sel.quantidade_paginas, 'gramaturasubstratoimpressao', CASE WHEN LOWER(COALESCE(comp_sel.descricao, '')) LIKE '%miolo%' THEN COALESCE(comp_sel.gramatura_catalogo, NULLIF(replace(regexp_replace(comp_sel.gramatura_miolo::text, '[^0-9.,]', '', 'g'), ',', '.'), '')::numeric) ELSE NULL END, 'perguntas_componente', COALESCE((SELECT json_agg(json_build_object('id_pergunta', bp.id_pergunta, 'pergunta', bp.nome, 'tipo', bp.tipo, 'resposta', rc.resposta) ORDER BY bp.id_pergunta)::jsonb FROM bremen_perguntas bp INNER JOIN respostas_componentes rc ON rc.pergunta_id = bp.id AND rc.id_componente = comp_sel.id_componente AND rc.especificacao_id = comp_sel.especificacao_id WHERE bp.id_componente = comp_sel.id_componente), '[]'::jsonb)) END)::jsonb)
                        FROM (SELECT DISTINCT ON (comp.id_componente) comp.componente_id, comp.id_componente, comp.descricao, comp.altura, comp.largura, comp.gramatura_miolo, comp.gramatura_catalogo, comp.quantidade_paginas, comp.especificacao_id FROM componentes comp WHERE ((ip.pares IS NOT NULL AND comp.pares = ip.pares AND comp.formulario_id = ip.formulario_id) OR (ip.pares IS NULL AND comp.especificacao_id = ip.especificacao_id)) ORDER BY comp.id_componente, CASE WHEN EXISTS (SELECT 1 FROM respostas_componentes rc_pref WHERE rc_pref.id_componente = comp.id_componente AND rc_pref.especificacao_id = comp.especificacao_id) THEN 0 ELSE 1 END, comp.especificacao_id) comp_sel
                    ), '[]'::json),
                    'perguntas_gerais', COALESCE((SELECT json_agg(json_build_object('tipo', bp.tipo, 'pergunta', bp.nome, 'resposta', rg.resposta, 'id_pergunta', bp.id_pergunta)) FROM bremen_perguntas bp INNER JOIN respostas_gerais rg ON rg.pergunta_id = bp.id AND rg.especificacao_id = ip.especificacao_id WHERE bp.id_geral = ip.id_produto), '[]'::json)
                ) ORDER BY ip.chave_agrupamento
            ), '[]'::json
        )
    )
)
FROM itens_produto ip
GROUP BY ip.cliente_id, ip.tipo_agrupamento
ORDER BY ip.cliente_id, ip.tipo_agrupamento DESC;
"""

class ModernDashboardApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Dashboard Logístico - Gestão de Arquivos (Com Checkbox)")
        self.root.geometry("1300x850")
        self.root.configure(bg="#f0f2f5") 

        # Dicionários para controlar o estado e dados
        self.dados_map = {}
        self.check_states = {} 

        self.setup_styles()
        self.init_icons()
        self.create_layout()

    def init_icons(self):
        # Ícones para o Checkbox (Gerados via código para não precisar de arquivos externos)
        self.img_unchecked = tk.PhotoImage(width=20, height=20)
        self.img_unchecked.put(("#7f8c8d",), to=(2, 2, 18, 18)) # Borda cinza
        self.img_unchecked.put(("white",), to=(4, 4, 16, 16))   # Miolo branco

        self.img_checked = tk.PhotoImage(width=20, height=20)
        self.img_checked.put(("#27ae60",), to=(2, 2, 18, 18))   # Fundo verde
        self.img_checked.put(("white",), to=(5, 9, 9, 14))      # Simbolo Check
        self.img_checked.put(("white",), to=(9, 14, 15, 6))

    def setup_styles(self):
        style = ttk.Style()
        style.theme_use("clam")
        
        style.configure("Modern.Treeview",
            background="white",
            foreground="#2c3e50",
            fieldbackground="white",
            font=('Segoe UI', 10),
            rowheight=28,
            borderwidth=0
        )
        style.configure("Modern.Treeview.Heading",
            background="#34495e", foreground="white",
            font=('Segoe UI', 10, 'bold'), relief="flat"
        )
        style.map("Modern.Treeview", background=[('selected', '#d6eaf8')], foreground=[('selected', 'black')])

    def create_layout(self):
        # Header
        header = tk.Frame(self.root, bg="#2c3e50", height=60)
        header.pack(fill="x")
        tk.Label(header, text="DASHBOARD ORÇAMENTOS & ARQUIVOS", font=("Segoe UI", 16, "bold"), 
                 bg="#2c3e50", fg="white").pack(side="left", padx=20, pady=10)

        # Divisão da Tela
        pane = tk.PanedWindow(self.root, orient="vertical", sashwidth=4, bg="#bdc3c7")
        pane.pack(fill="both", expand=True, padx=10, pady=10)

        # 1. Área da Tabela
        top_frame = tk.Frame(pane, bg="white")
        pane.add(top_frame, height=550)

        # Botão de atualizar tabela
        toolbar = tk.Frame(top_frame, bg="#ecf0f1", padx=10, pady=5)
        toolbar.pack(fill="x")
        tk.Button(toolbar, text="🔄 Recarregar Tabela", command=self.carregar_dados, bg="#95a5a6", fg="white").pack(side="left")

        # Treeview
        tree_scroll = ttk.Scrollbar(top_frame)
        tree_scroll.pack(side="right", fill="y")
        
        self.tree = ttk.Treeview(top_frame, columns=("info", "qtd"), yscrollcommand=tree_scroll.set, style="Modern.Treeview")
        self.tree.heading("#0", text=" Seleção (Checkbox)", anchor="w")
        self.tree.heading("info", text="Detalhes", anchor="w")
        self.tree.heading("qtd", text="Qtd", anchor="center")
        
        self.tree.column("#0", width=450)
        self.tree.column("info", width=300)
        self.tree.column("qtd", width=100, anchor="center")

        tree_scroll.config(command=self.tree.yview)
        self.tree.pack(fill="both", expand=True)

        # Evento de Clique para Checkbox
        self.tree.bind("<Button-1>", self.on_tree_click)

        # 2. Área de Ação
        bottom_frame = tk.Frame(pane, bg="#ecf0f1", padx=20, pady=20)
        pane.add(bottom_frame)

        tk.Label(bottom_frame, text="Marque as caixas acima e clique no botão para gerar o JSON do orçamento:",
                 bg="#ecf0f1", font=("Segoe UI", 10), fg="#7f8c8d").pack(anchor="w")

        btn_processar = tk.Button(bottom_frame, text="✅ GERAR JSON COM ITENS MARCADOS", 
                                  command=self.executar_geracao_checked,
                                  bg="#2980b9", fg="white", font=("Segoe UI", 12, "bold"), 
                                  relief="flat", padx=20, pady=10, cursor="hand2")
        btn_processar.pack(anchor="w", pady=10)

        self.lbl_status = tk.Label(self.root, text="Pronto.", bd=1, relief="sunken", anchor="w")
        self.lbl_status.pack(side="bottom", fill="x")

        self.root.after(500, self.carregar_dados)

    def buscar_dados(self):
        try:
            conn = psycopg2.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute(SQL_HIERARQUIA)
            res = cursor.fetchone()
            conn.close()
            return res[0] if res else []
        except Exception as e:
            messagebox.showerror("Erro Banco", str(e))
            return []

    def carregar_dados(self):
        for item in self.tree.get_children():
            self.tree.delete(item)
        self.dados_map.clear()
        self.check_states.clear()

        raw_data = self.buscar_dados()
        if not raw_data: return

        # Preenche a árvore iniciando desmarcado
        for div in raw_data:
            div_id = self.insert_node("", div['divisao_logistica'], values=(f"Dias: {div['dias_uteis']}", ""), 
                                      tipo='divisao', obj=div, open=True)
            
            for prod in (div.get('produtos') or []):
                prod_id = self.insert_node(div_id, prod['produto'], values=("", prod['quantidade']),
                                           tipo='produto', obj=prod, id_real=prod['id_produto'])
                
                for dt in (prod.get('datas') or []):
                    dt_val = dt['data_saida']
                    dt_id = self.insert_node(prod_id, f"Saída: {dt_val}", values=("", dt['quantidade']),
                                             tipo='data', obj=dt, id_real=prod['id_produto'], extra=dt_val)
                    
                    for arq in (dt.get('arquivos') or []):
                        self.insert_node(dt_id, arq['arquivo'], values=(f"Páginas: {arq['paginas']}", f"Cópias: {arq['copias']}"),
                                         tipo='arquivo', obj=arq)
        
        self.lbl_status.config(text="Dados carregados. Marque as opções desejadas.")

    def insert_node(self, parent, text, values, tipo, obj, id_real=None, extra=None, open=False):
        # Inserir item com ícone de unchecked
        item_id = self.tree.insert(parent, "end", text=f"  {text}", values=values, open=open, image=self.img_unchecked)
        
        self.dados_map[item_id] = {
            'tipo': tipo, 'obj': obj, 'id_real': id_real, 'extra': extra
        }
        self.check_states[item_id] = False
        return item_id

    # --- LÓGICA DE CHECKBOX (CASCATA) ---
    def on_tree_click(self, event):
        region = self.tree.identify("region", event.x, event.y)
        if region == "tree": 
            item_id = self.tree.identify_row(event.y)
            if item_id:
                self.toggle_check(item_id)

    def toggle_check(self, item_id):
        # Inverte estado
        current_state = self.check_states.get(item_id, False)
        new_state = not current_state
        self.set_node_state(item_id, new_state)
        # Propaga para filhos
        self.propagate_down(item_id, new_state)
        # Propaga para pai (opcional: se todos filhos marcados, marca pai) - Implementação simplificada aqui

    def set_node_state(self, item_id, state):
        self.check_states[item_id] = state
        img = self.img_checked if state else self.img_unchecked
        self.tree.item(item_id, image=img)

    def propagate_down(self, parent_id, state):
        children = self.tree.get_children(parent_id)
        for child in children:
            self.set_node_state(child, state)
            self.propagate_down(child, state)

    # --- GERAÇÃO DO JSON ---
    def executar_geracao_checked(self):
        # 1. Coleta IDs marcados
        ids_produtos = set()
        datas_saida = set()

        count_checked = 0
        for item_id, is_checked in self.check_states.items():
            if not is_checked: continue
            
            count_checked += 1
            dados = self.dados_map.get(item_id)
            tipo = dados['tipo']

            if tipo == 'produto':
                ids_produtos.add(dados['id_real'])
            
            if tipo == 'data':
                dt_val = dados['extra']
                # Se não for "Sem data saida", adiciona ao filtro
                if dt_val and dt_val != 'Sem data saida':
                    datas_saida.add(dt_val)

        if count_checked == 0:
            messagebox.showwarning("Aviso", "Nenhum item marcado! Selecione produtos ou datas.")
            return

        # 2. Pergunta onde salvar
        destino = filedialog.askdirectory(title="Selecione a pasta para salvar o JSON")
        if not destino: return

        self.lbl_status.config(text="Gerando JSON no banco de dados...", fg="blue")
        self.root.update()

        # 3. Chama a função que executa o SQL do Orçamento
        caminho_arquivo = self.gerar_json_orcamento(list(ids_produtos), list(datas_saida), destino)

        if caminho_arquivo:
            messagebox.showinfo("Sucesso", f"JSON gerado com sucesso em:\n{caminho_arquivo}")
            self.lbl_status.config(text="Pronto.")
        else:
            self.lbl_status.config(text="Erro na geração.")

    def gerar_json_orcamento(self, ids, datas, pasta):
        # Formata para SQL Array: Ex: 1,2,3
        str_ids = ",".join(map(str, ids)) if ids else ""
        
        # Formata datas para SQL Array: Ex: '2023-01-01','2023-01-02'
        str_datas = ",".join([f"'{d}'" for d in datas]) if datas else ""

        # Monta a query final injetando os valores
        # Se arrays ficarem vazios, o SQL trata como ARRAY[] (vazio)
        sql_final = SQL_ORCAMENTO_TEMPLATE.format(
            ids_produtos=str_ids,
            datas_saida=str_datas
        )

        print("Executando SQL...") # Debug

        try:
            conn = psycopg2.connect(**DB_CONFIG)
            cur = conn.cursor()
            cur.execute(sql_final)
            result = cur.fetchone()
            conn.close()

            if result and result[0]:
                nome_arquivo = f"orcamento_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
                caminho_completo = os.path.join(pasta, nome_arquivo)
                
                with open(caminho_completo, "w", encoding='utf-8') as f:
                    json.dump(result[0], f, indent=4, ensure_ascii=False)
                
                return caminho_completo
            else:
                messagebox.showerror("Erro", "A query retornou vazio. Verifique se os produtos selecionados têm dados.")
                return None
        except Exception as e:
            messagebox.showerror("Erro SQL", f"Falha ao gerar o JSON:\n{e}")
            print(e)
            return None

if __name__ == "__main__":
    root = tk.Tk()
    app = ModernDashboardApp(root)
    root.mainloop()