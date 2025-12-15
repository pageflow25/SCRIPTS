"""
Módulo de conexão e operações com o banco de dados PostgreSQL
"""
import psycopg2
import psycopg2.extras
import logging
import os
from dotenv import load_dotenv
from datetime import datetime
from typing import List, Dict, Any, Optional

# Carregar variáveis de ambiente
load_dotenv()

logger = logging.getLogger(__name__)


class Database:
    """Classe para gerenciar conexões e operações no banco de dados"""
    
    def __init__(self):
        """Inicializa a conexão com o banco de dados"""
        self.conn = None
        self.cursor = None
        
    def __enter__(self):
        """Context manager - conecta ao entrar"""
        self.connect()
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager - desconecta ao sair"""
        self.close()
        
    def connect(self):
        """Estabelece conexão com o banco de dados"""
        try:
            self.conn = psycopg2.connect(
                host=os.getenv('DB_HOST_TEST'),
                port=os.getenv('DB_PORT_TEST'),
                database=os.getenv('DB_NAME_TEST'),
                user=os.getenv('DB_USER_TEST'),
                password=os.getenv('DB_PASSWORD_TEST'),
                sslmode='require' if os.getenv('DB_SSL_TEST', 'true').lower() == 'true' else 'prefer'
            )
            self.cursor = self.conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
            logger.info("Conexão com banco de dados estabelecida")
        except Exception as e:
            logger.error(f"Erro ao conectar ao banco de dados: {e}")
            raise
    
    def close(self):
        """Fecha a conexão com o banco de dados"""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
            logger.info("Conexão com banco de dados fechada")
    
    def execute_query(self, query: str, params: tuple = None) -> List[Dict[str, Any]]:
        """
        Executa uma query SELECT e retorna os resultados
        
        Args:
            query: SQL query
            params: Parâmetros para a query
            
        Returns:
            Lista de dicionários com os resultados
        """
        try:
            self.cursor.execute(query, params)
            return self.cursor.fetchall()
        except Exception as e:
            logger.error(f"Erro ao executar query: {e}")
            raise
    
    def execute_update(self, query: str, params: tuple = None) -> int:
        """
        Executa uma query INSERT/UPDATE/DELETE
        
        Args:
            query: SQL query
            params: Parâmetros para a query
            
        Returns:
            Número de linhas afetadas
        """
        try:
            self.cursor.execute(query, params)
            self.conn.commit()
            return self.cursor.rowcount
        except Exception as e:
            self.conn.rollback()
            logger.error(f"Erro ao executar update: {e}")
            raise
    
    def get_orcamentos_json(self, escola_id: int, ids_produtos: List[int] = None, 
                           datas_saida: List[str] = None) -> List[Dict[str, Any]]:
        """
        Executa o SQL de geração de orçamentos e retorna os JSONs
        
        Args:
            escola_id: ID da escola
            ids_produtos: Lista de IDs de produtos (opcional)
            datas_saida: Lista de datas de saída (opcional)
            
        Returns:
            Lista de dicionários com os orçamentos gerados
        """
        # Ler o arquivo SQL
        sql_file = os.path.join(os.path.dirname(__file__), 'sql_orcamento.sql')
        with open(sql_file, 'r', encoding='utf-8') as f:
            sql_template = f.read()
        
        # Substituir parâmetros no SQL
        if ids_produtos:
            produtos_array = f"ARRAY[{', '.join(map(str, ids_produtos))}]"
        else:
            produtos_array = "NULL"
        
        if datas_saida:
            datas_formatadas = [f"'{d}'" for d in datas_saida]
            datas_array = f"ARRAY[{', '.join(datas_formatadas)}]::date[]"
        else:
            datas_array = "NULL"
        
        # Substituir valores no SQL
        sql = sql_template.replace('15 AS escola_id', f'{escola_id} AS escola_id')
        sql = sql.replace('ARRAY[227, 228, 229, 230] AS ids_produtos', f'{produtos_array} AS ids_produtos')
        sql = sql.replace("ARRAY['2025-12-19', '2025-12-29', '2025-12-31', '2026-01-06']::date[] AS datas_saida", 
                         f'{datas_array} AS datas_saida')
        
        logger.info(f"Executando SQL de orçamento para escola_id={escola_id}")
        return self.execute_query(sql)
    
    def obter_datas_entrega(self, escola_id: int, cliente_id: int = None) -> Dict[int, str]:
        """
        Obtém as datas de entrega da tabela distribuicao_materiais
        
        Args:
            escola_id: ID da escola
            cliente_id: ID do cliente (opcional)
            
        Returns:
            Dicionário mapeando distribuicao_material_id -> data_saida
        """
        query = """
        SELECT 
            dm.id as distribuicao_material_id,
            dm.data_saida,
            ef.id_produto
        FROM distribuicao_materiais dm
        JOIN especificacoes_form ef ON ef.id = dm.especificacao_form_id
        JOIN unidades_escolares ue ON ue.id = dm.unidade_escolar_id
        WHERE ue.escola_id = %s
            AND dm.data_saida IS NOT NULL
            AND dm.data_saida != ''
        """
        
        params = [escola_id]
        if cliente_id:
            query += " AND ue.cliente_id = %s"
            params.append(cliente_id)
        
        results = self.execute_query(query, tuple(params))
        
        datas = {}
        for row in results:
            datas[row['distribuicao_material_id']] = row['data_saida']
        
        logger.info(f"Obtidas {len(datas)} datas de entrega para escola_id={escola_id}")
        return datas
    
    def salvar_orcamento_api(self, distribuicao_material_id: int, id_orcamento: int, 
                            itens: List[Dict[str, Any]], resposta_completa: Dict[str, Any]) -> int:
        """
        Salva o retorno da API de criação de orçamento na tabela orcamento_api
        
        Args:
            distribuicao_material_id: ID da distribuição de material
            id_orcamento: ID do orçamento retornado pela API
            itens: Lista de itens retornados pela API
            resposta_completa: JSON completo da resposta da API
            
        Returns:
            ID do registro inserido
        """
        import json
        
        query = """
        INSERT INTO orcamento_api 
        (distribuicao_material_id, id_orcamento, itens, resposta_api, criado_em)
        VALUES (%s, %s, %s, %s, CURRENT_TIMESTAMP)
        RETURNING id
        """
        
        itens_json = json.dumps(itens, ensure_ascii=False)
        resposta_json = json.dumps(resposta_completa, ensure_ascii=False)
        
        try:
            self.cursor.execute(query, (
                distribuicao_material_id,
                id_orcamento,
                itens_json,
                resposta_json
            ))
            self.conn.commit()
            result = self.cursor.fetchone()
            logger.info(f"Orçamento {id_orcamento} salvo na tabela orcamento_api (ID: {result['id']})")
            return result['id']
        except Exception as e:
            self.conn.rollback()
            logger.error(f"Erro ao salvar orçamento na base: {e}")
            raise
    
    def salvar_aprovacao_api(self, distribuicao_material_id: int, id_orcamento: int, 
                            id_ops: List[int], pedidos: List[int], 
                            resposta_completa: Dict[str, Any]) -> int:
        """
        Salva o retorno da API de aprovação de proposta na tabela aprovacao_api
        
        Args:
            distribuicao_material_id: ID da distribuição de material
            id_orcamento: ID do orçamento
            id_ops: Lista de IDs das OPs geradas
            pedidos: Lista de IDs dos pedidos gerados
            resposta_completa: JSON completo da resposta da API
            
        Returns:
            ID do registro inserido
        """
        import json
        
        query = """
        INSERT INTO aprovacao_api 
        (distribuicao_material_id, id_orcamento, id_ops, pedidos, resposta_api, criado_em)
        VALUES (%s, %s, %s, %s, %s, CURRENT_TIMESTAMP)
        RETURNING id
        """
        
        id_ops_json = json.dumps(id_ops, ensure_ascii=False)
        pedidos_json = json.dumps(pedidos, ensure_ascii=False)
        resposta_json = json.dumps(resposta_completa, ensure_ascii=False)
        
        try:
            self.cursor.execute(query, (
                distribuicao_material_id,
                id_orcamento,
                id_ops_json,
                pedidos_json,
                resposta_json
            ))
            self.conn.commit()
            result = self.cursor.fetchone()
            logger.info(f"Aprovação do orçamento {id_orcamento} salva na tabela aprovacao_api (ID: {result['id']})")
            return result['id']
        except Exception as e:
            self.conn.rollback()
            logger.error(f"Erro ao salvar aprovação na base: {e}")
            raise
    
    def obter_distribuicoes_por_orcamento(self, cliente_id: int, escola_id: int) -> Dict[str, List[int]]:
        """
        Obtém os IDs de distribuição de materiais agrupados por chave de orçamento
        
        Args:
            cliente_id: ID do cliente
            escola_id: ID da escola
            
        Returns:
            Dicionário mapeando chave_orcamento -> [lista de distribuicao_material_id]
        """
        query = """
        SELECT 
            dm.id as distribuicao_material_id,
            ef.id_produto,
            dm.data_saida,
            COALESCE(ap.pares::text, ef.id::text) as chave_agrupamento
        FROM distribuicao_materiais dm
        JOIN especificacoes_form ef ON ef.id = dm.especificacao_form_id
        JOIN unidades_escolares ue ON ue.id = dm.unidade_escolar_id
        LEFT JOIN arquivo_pdfs ap ON ap.item_pedido_id = ef.id
        WHERE ue.cliente_id = %s
            AND ue.escola_id = %s
            AND dm.quantidade > 0
        ORDER BY chave_agrupamento, dm.id
        """
        
        results = self.execute_query(query, (cliente_id, escola_id))
        
        distribuicoes = {}
        for row in results:
            chave = row['chave_agrupamento']
            if chave not in distribuicoes:
                distribuicoes[chave] = []
            distribuicoes[chave].append(row['distribuicao_material_id'])
        
        return distribuicoes
