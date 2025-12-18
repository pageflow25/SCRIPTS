import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
import psycopg2
import json

# --- CONFIGURAÇÃO DO BANCO DE DADOS ---
# Certifique-se de que as credenciais estão corretas para o seu ambiente
DB_CONFIG = {
    'host': 'aws-1-sa-east-1.pooler.supabase.com',
    'port': '6543',
    'dbname': 'postgres',
    'user': 'postgres.hrrxtytvaqyrjjonhann',
    'password': '0ffNxezYd5thvteQ',
    'sslmode': 'require'
}

# --- NOVA QUERY SQL (Nível 4 agora são Arquivos) ---
SQL_HIERARQUIA = """
WITH dados_normalizados AS (
    SELECT
        -- TRATAMENTO DE NULOS
        COALESCE(uc.divisao_logistica, 'Sem divisão') AS divisao_logistica,
        COALESCE(CAST(uc.dias_uteis AS TEXT), 'Sem dias uteis') AS dias_uteis,

        -- PRODUTO
        b.id_produto,
        b.descricao AS nome_produto,

        -- DATA DE SAÍDA
        COALESCE(
            TO_CHAR(CAST(distri.data_saida AS DATE), 'YYYY-MM-DD'),
            'Sem data saida'
        ) AS data_saida_formatada,

        -- ARQUIVO (NÍVEL 4)
        ar.id AS arquivo_id,
        ar.nome as nome_arquivo,
        distri.quantidade as quantidade,
        ar.paginas as paginas

    FROM formularios f
    INNER JOIN especificacoes_form e 
        ON f.id = e.formulario_id
    INNER JOIN arquivo_pdfs ar 
        ON ar.item_pedido_id = e.id
    INNER JOIN distribuicao_materiais distri 
        ON distri.arquivo_pdf_id = ar.id
    INNER JOIN unidades_escolares uc 
        ON distri.unidade_escolar_id = uc.id
    INNER JOIN bremen_itens b 
        ON e.id_produto = b.id_produto
    WHERE UPPER(f.tipo_formulario) = UPPER('SANTA CATARINA')
),

-- NÍVEL 4: ARQUIVOS
nivel_arquivos AS (
    SELECT
        divisao_logistica,
        dias_uteis,
        id_produto,
        nome_produto,
        data_saida_formatada,

        COUNT(*) AS qtd_arquivos,

        JSONB_AGG(
            JSONB_BUILD_OBJECT(
                'arquivo', nome_arquivo,
                'copias', quantidade,
                'paginas', paginas
            ) ORDER BY nome_arquivo ASC
        ) AS lista_arquivos

    FROM dados_normalizados
    GROUP BY 1,2,3,4,5
),

-- NÍVEL 3: DATAS
nivel_datas AS (
    SELECT
        divisao_logistica,
        dias_uteis,
        id_produto,
        nome_produto,

        SUM(qtd_arquivos) AS qtd_produto,

        JSONB_AGG(
            JSONB_BUILD_OBJECT(
                'data_saida', data_saida_formatada,
                'quantidade', qtd_arquivos,
                'arquivos', lista_arquivos
            ) ORDER BY data_saida_formatada DESC
        ) AS lista_datas

    FROM nivel_arquivos
    GROUP BY 1,2,3,4
),

-- NÍVEL 2: PRODUTOS
nivel_produtos AS (
    SELECT
        divisao_logistica,
        dias_uteis,

        SUM(qtd_produto) AS qtd_divisao,

        JSONB_AGG(
            JSONB_BUILD_OBJECT(
                'id_produto', id_produto,
                'produto', nome_produto,
                'quantidade', qtd_produto,
                'datas', lista_datas
            ) ORDER BY nome_produto ASC
        ) AS lista_produtos

    FROM nivel_datas
    GROUP BY 1,2
),

-- NÍVEL 1: DIVISÕES
nivel_divisoes AS (
    SELECT
        JSONB_BUILD_OBJECT(
            'divisao_logistica', divisao_logistica,
            'dias_uteis', dias_uteis,
            'quantidade_total', qtd_divisao,
            'produtos', lista_produtos
        ) AS objeto_divisao
    FROM nivel_produtos
    ORDER BY divisao_logistica ASC
)

-- RESULTADO FINAL
SELECT 
    JSONB_AGG(objeto_divisao) AS dashboard_completo
FROM nivel_divisoes;
"""

class ModernDashboardApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Dashboard Logístico - Arquivos e Distribuição")
        self.root.geometry("1200x800")
        self.root.configure(bg="#f0f2f5") 

        self.setup_styles()

        # --- HEADER ---
        header_frame = tk.Frame(root, bg="#2c3e50", height=80)
        header_frame.pack(fill="x")
        
        lbl_titulo = tk.Label(
            header_frame, 
            text="MONITORAMENTO DE ARQUIVOS", 
            font=("Segoe UI", 18, "bold"), 
            bg="#2c3e50", 
            fg="white"
        )
        lbl_titulo.pack(pady=(20, 5))

        lbl_subtitulo = tk.Label(
            header_frame, 
            text="Hierarquia: Divisão > Produto > Data > Arquivo PDF", 
            font=("Segoe UI", 10), 
            bg="#2c3e50", 
            fg="#bdc3c7"
        )
        lbl_subtitulo.pack(pady=(0, 15))

        # --- CONTEÚDO ---
        main_frame = tk.Frame(root, bg="#f0f2f5")
        main_frame.pack(fill="both", expand=True, padx=20, pady=20)

        # Botão Carregar
        btn_frame = tk.Frame(main_frame, bg="#f0f2f5")
        btn_frame.pack(fill="x", pady=(0, 10))
        
        btn_load = tk.Button(
            btn_frame, 
            text="🔄  ATUALIZAR DADOS", 
            command=self.carregar_dados, 
            bg="#2980b9", 
            fg="white", 
            font=("Segoe UI", 10, "bold"),
            relief="flat",
            padx=20,
            pady=8,
            cursor="hand2"
        )
        btn_load.pack(side="left")

        # Treeview Container
        tree_container = tk.Frame(main_frame, bg="white", bd=1, relief="solid")
        tree_container.pack(fill="both", expand=True)

        scrollbar = ttk.Scrollbar(tree_container)
        scrollbar.pack(side="right", fill="y")

        # Configuração da Treeview
        # Colunas: info = Detalhes (Dias uteis / Paginas), qtd = Quantidade (Total / Copias)
        self.tree = ttk.Treeview(tree_container, columns=("info", "qtd"), yscrollcommand=scrollbar.set, style="Modern.Treeview")
        
        self.tree.heading("#0", text=" Estrutura Hierárquica", anchor="w")
        self.tree.heading("info", text="Detalhes / Páginas", anchor="w")
        self.tree.heading("qtd", text="Qtd / Cópias", anchor="center")

        self.tree.column("#0", minwidth=450, width=600)
        self.tree.column("info", minwidth=200, width=300)
        self.tree.column("qtd", minwidth=100, width=120, anchor="center")

        scrollbar.config(command=self.tree.yview)
        self.tree.pack(fill="both", expand=True)
        
        self.tree.tag_configure('oddrow', background="white")
        self.tree.tag_configure('evenrow', background="#f7f9fa") 

        # --- BARRA DE STATUS ---
        self.lbl_status = tk.Label(root, text="Pronto para carregar.", bd=1, relief="sunken", anchor="w", font=("Segoe UI", 9), bg="#ecf0f1", padx=10, pady=5)
        self.lbl_status.pack(side="bottom", fill="x")

        self.root.after(500, self.carregar_dados)

    def setup_styles(self):
        style = ttk.Style()
        style.theme_use("clam")

        style.configure("Modern.Treeview",
            background="white",
            foreground="#2c3e50",
            fieldbackground="white",
            font=('Segoe UI', 11),
            rowheight=35,
            borderwidth=0
        )
        
        style.configure("Modern.Treeview.Heading",
            background="#34495e",
            foreground="white",
            font=('Segoe UI', 11, 'bold'),
            relief="flat"
        )
        
        style.map("Modern.Treeview.Heading",
            background=[('active', '#2c3e50')]
        )
        
        style.map("Modern.Treeview",
            background=[('selected', '#3498db')],
            foreground=[('selected', 'white')]
        )

    def buscar_dados_postgres(self):
        self.lbl_status.config(text="Conectando ao banco de dados...", fg="#e67e22")
        self.root.update()
        conn = None
        try:
            conn = psycopg2.connect(**DB_CONFIG)
            cursor = conn.cursor()
            cursor.execute(SQL_HIERARQUIA)
            result = cursor.fetchone()
            conn.close()

            if result and result[0]:
                return result[0]
            return []
        except Exception as e:
            self.lbl_status.config(text="Erro de conexão", fg="#c0392b")
            messagebox.showerror("Erro Crítico", f"Falha na conexão:\n{e}")
            return None

    def carregar_dados(self):
        for item in self.tree.get_children():
            self.tree.delete(item)

        dados = self.buscar_dados_postgres()
        if not dados:
            self.lbl_status.config(text="Nenhum dado encontrado.", fg="black")
            return

        self.lbl_status.config(text=f"Processando dados...", fg="blue")
        
        count = 0
        for divisao in dados:
            tag = 'evenrow' if count % 2 == 0 else 'oddrow'
            
            # Nível 1: Divisão
            div_nome = divisao.get('divisao_logistica', 'N/A')
            dias = divisao.get('dias_uteis', 'N/A')
            total = divisao.get('quantidade_total', 0)
            
            node_div = self.tree.insert(
                "", "end", 
                text=f" 🚛  {div_nome}", 
                values=(f"Dias Úteis: {dias}", f"Total: {total}"),
                tags=(tag,),
                open=True # Abre automaticamente o primeiro nível
            )

            produtos = divisao.get('produtos') or []
            for prod in produtos:
                # Nível 2: Produto
                prod_nome = prod.get('produto', 'Sem Nome')
                prod_qtd = prod.get('quantidade', 0)
                
                node_prod = self.tree.insert(
                    node_div, "end",
                    text=f"  📦  {prod_nome}",
                    values=("", f"{prod_qtd}"),
                    tags=('child',)
                )

                datas = prod.get('datas') or []
                for data_item in datas:
                    # Nível 3: Data
                    dt_saida = data_item.get('data_saida', 'N/A')
                    dt_qtd = data_item.get('quantidade', 0)

                    node_data = self.tree.insert(
                        node_prod, "end",
                        text=f"    🗓️  Saída: {dt_saida}",
                        values=("", f"{dt_qtd}"),
                        tags=('child',)
                    )

                    # --- MUDANÇA PRINCIPAL AQUI (NÍVEL 4: ARQUIVOS) ---
                    arquivos = data_item.get('arquivos') or [] # Agora busca por 'arquivos'
                    for arq in arquivos:
                        # Extrai os novos campos do JSON
                        nome_arq = arq.get('arquivo', 'Sem Nome')
                        copias = arq.get('copias', 0)
                        paginas = arq.get('paginas', 0)

                        self.tree.insert(
                            node_data, "end",
                            text=f"      📄  {nome_arq}",
                            values=(f"Páginas: {paginas}", f"Cópias: {copias}"), # Exibe páginas e cópias
                            tags=('child',)
                        )
            count += 1
            
        self.lbl_status.config(text="Dados atualizados com sucesso.", fg="#27ae60")

if __name__ == "__main__":
    root = tk.Tk()
    app = ModernDashboardApp(root)
    root.mainloop()