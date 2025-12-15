import logging
import sys
import json
import os
from datetime import datetime
from typing import Dict, Any, List
from database import Database
from api_client import APIClient

# Configurar logging (Forçando utf-8 no arquivo e tratamento seguro no console)
# Removemos caracteres especiais dos logs para evitar erro de charmap no Windows
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler(f'automacao_no_db_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log', encoding='utf-8'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

class AutomacaoOrcamentos:
    """Classe principal para automação de orçamentos (SEM SALVAR NO BANCO)"""
    
    def __init__(self):
        """Inicializa a automação"""
        self.db = None
        self.api_client = APIClient()
        self.estatisticas = {
            'orcamentos_processados': 0,
            'orcamentos_criados': 0,
            'orcamentos_falhados': 0,
            'propostas_aprovadas': 0,
            'propostas_falhadas': 0
        }
    
    def processar_orcamento(self, orcamento_json: Dict[str, Any], 
                            datas_entrega: Dict[int, str],
                            cliente_id: int) -> bool:
        """
        Processa um único orçamento: cria e aprova (SEM SALVAR RETORNO)
        """
        try:
            logger.info("="*80)
            logger.info("PROCESSANDO NOVO ORCAMENTO (MODO: NAO SALVAR NO BANCO)")
            logger.info("="*80)
            
            # Extrair dados do JSON
            distribuicao_id = orcamento_json.get('distribuicao_material_id', 0)
            payload = orcamento_json.get('json_build_object')
            
            if isinstance(payload, str):
                payload = json.loads(payload)
            
            # Validar payload
            if not self.api_client.validar_payload_orcamento(payload):
                logger.error("[ERRO] Payload invalido - pulando orcamento")
                self.estatisticas['orcamentos_falhados'] += 1
                return False
            
            # 1. CRIAR ORÇAMENTO VIA API
            logger.info("\n--- ETAPA 1: Criacao do Orcamento (API) ---")
            try:
                resposta_orcamento = self.api_client.criar_orcamento(payload)
                
                if not resposta_orcamento.get('success'):
                    logger.error("[ERRO] Falha na criacao do orcamento")
                    self.estatisticas['orcamentos_falhados'] += 1
                    return False
                
                # Extrair dados da resposta
                data = resposta_orcamento.get('data', {})
                id_orcamento = data.get('id_orcamento')
                itens = data.get('itens', [])
                
                logger.info(f"[OK] Orcamento criado na API - ID: {id_orcamento}")
                logger.info(f"[OK] Total de itens: {len(itens)}")
                
                self.estatisticas['orcamentos_criados'] += 1
                
            except Exception as e:
                logger.error(f"[ERRO] Erro ao criar orcamento: {e}")
                self.estatisticas['orcamentos_falhados'] += 1
                return False
            
            # 2. SALVAR ORÇAMENTO NO BANCO -> REMOVIDO
            logger.info("\n--- ETAPA 2: Salvamento do Orcamento ---")
            logger.info(">> SKIPPING: Salvamento no banco desativado conforme solicitado.")
            
            # 3. PREPARAR APROVAÇÃO DA PROPOSTA
            logger.info("\n--- ETAPA 3: Preparacao da Aprovacao ---")
            
            itens_aprovacao = []
            for item in itens:
                item_id = item.get('id')
                
                data_entrega = None
                if datas_entrega:
                    data_entrega = list(datas_entrega.values())[0] if datas_entrega else None
                
                if not data_entrega:
                    from datetime import timedelta
                    data_entrega = (datetime.now() + timedelta(days=30)).strftime('%Y-%m-%d')
                
                data_formatada = self.api_client.formatar_data_entrega(data_entrega)
                
                itens_aprovacao.append({
                    "id": item_id,
                    "data_entrega": data_formatada
                })
            
            # 4. APROVAR PROPOSTA VIA API
            logger.info("\n--- ETAPA 4: Aprovacao da Proposta (API) ---")
            try:
                resposta_aprovacao = self.api_client.aprovar_proposta(
                    id_orcamento=id_orcamento,
                    itens_aprovacao=itens_aprovacao,
                    gerar_op=True
                )
                
                if not resposta_aprovacao.get('success'):
                    logger.error("[ERRO] Falha na aprovacao da proposta")
                    self.estatisticas['propostas_falhadas'] += 1
                    return False
                
                logger.info(f"[OK] Proposta aprovada na API - Orcamento ID: {id_orcamento}")
                self.estatisticas['propostas_aprovadas'] += 1
                
                # CORREÇÃO DO ERRO DE LISTA vs DICT
                data_aprovacao = resposta_aprovacao.get('data')
                ops = []
                pedidos = []

                if isinstance(data_aprovacao, dict):
                    ops = data_aprovacao.get('ops', [])
                    pedidos = data_aprovacao.get('pedidos', [])
                    logger.info(f"[OK] OPs geradas (API): {len(ops)}")
                    logger.info(f"[OK] Pedidos gerados (API): {len(pedidos)}")
                elif isinstance(data_aprovacao, list):
                    logger.info(f"[OK] Dados retornados como Lista. Quantidade de registros: {len(data_aprovacao)}")
                    # Se for lista, não tentamos extrair ops/pedidos da forma tradicional pois não vamos salvar
                else:
                    logger.warning(f"[AVISO] Formato de dados de aprovacao desconhecido: {type(data_aprovacao)}")
                
            except Exception as e:
                logger.error(f"[ERRO] Erro ao aprovar proposta: {e}")
                # Log extra para debug se der erro de novo
                import traceback
                logger.error(traceback.format_exc())
                self.estatisticas['propostas_falhadas'] += 1
                return False
            
            # 5. SALVAR APROVAÇÃO NO BANCO -> REMOVIDO
            logger.info("\n--- ETAPA 5: Salvamento da Aprovacao ---")
            logger.info(">> SKIPPING: Salvamento no banco desativado conforme solicitado.")
            
            logger.info("\n" + "="*80)
            logger.info("[OK] ORCAMENTO PROCESSADO (SEM PERSISTENCIA)")
            logger.info("="*80)
            
            return True
            
        except Exception as e:
            logger.error(f"[ERRO] Erro ao processar orcamento: {e}")
            import traceback
            logger.error(traceback.format_exc())
            self.estatisticas['orcamentos_falhados'] += 1
            return False

    def executar(self, escola_id: int, ids_produtos: List[int] = None, 
                 datas_saida: List[str] = None):
        """
        Executa a automação completa
        """
        logger.info("\n" + "="*80)
        logger.info("INICIANDO LOOP DE AUTOMACAO (SEM SAVE)")
        logger.info("="*80)
        
        inicio = datetime.now()
        
        try:
            # Conectar ao banco APENAS PARA LER OS DADOS DE ENTRADA
            self.db = Database()
            self.db.connect()
            
            # 1. LER ORÇAMENTOS (Mantido para saber o que gerar)
            logger.info("\n--- Lendo dados de origem do banco ---")
            orcamentos = self.db.get_orcamentos_json(
                escola_id=escola_id,
                ids_produtos=ids_produtos,
                datas_saida=datas_saida
            )
            
            if not orcamentos:
                logger.warning("[AVISO] Nenhum dado encontrado para processar")
                return
            
            logger.info(f"[OK] {len(orcamentos)} registros encontrados para processamento")
            
            # 2. OBTER DATAS DE ENTREGA
            primeiro_orcamento = orcamentos[0]
            cliente_id = None
            
            if isinstance(primeiro_orcamento, dict):
                # Tentativa robusta de pegar o ID do cliente
                try:
                    orcamento_data = list(primeiro_orcamento.values())[0]
                    if isinstance(orcamento_data, str):
                        orcamento_data = json.loads(orcamento_data)
                    
                    if isinstance(orcamento_data, dict) and 'data' in orcamento_data:
                        cliente_id = orcamento_data['data'].get('id_cliente')
                except Exception as e:
                    logger.warning(f"Nao foi possivel extrair ID do cliente: {e}")

            datas_entrega = self.db.obter_datas_entrega(
                escola_id=escola_id,
                cliente_id=cliente_id
            )
            
            # 3. LOOP DE PROCESSAMENTO
            logger.info("\n--- Iniciando Loop de Processamento ---")
            
            for idx, orcamento in enumerate(orcamentos, 1):
                logger.info(f"\n{'='*80}")
                logger.info(f"ITEM {idx}/{len(orcamentos)}")
                
                self.processar_orcamento(
                    orcamento_json=orcamento,
                    datas_entrega=datas_entrega,
                    cliente_id=cliente_id
                )
                
                # Pequena pausa
                import time
                time.sleep(1)
            
        except Exception as e:
            logger.error(f"[ERRO] Erro critico: {e}")
            import traceback
            logger.error(traceback.format_exc())
            
        finally:
            if self.db:
                self.db.close()
            
            # RELATÓRIO
            logger.info("\n" + "="*80)
            logger.info("FIM DO PROCESSAMENTO (MODO NO-DB-SAVE)")
            logger.info(f"Orcamentos criados (API): {self.estatisticas['orcamentos_criados']}")
            logger.info(f"Propostas aprovadas (API): {self.estatisticas['propostas_aprovadas']}")
            logger.info("="*80)

def main():
    # Configuração
    ESCOLA_ID = 15
    IDS_PRODUTOS = [227, 228, 229, 230]
    DATAS_SAIDA = ['2025-12-19', '2025-12-29', '2025-12-31', '2026-01-06']
    
    automacao = AutomacaoOrcamentos()
    automacao.executar(
        escola_id=ESCOLA_ID,
        ids_produtos=IDS_PRODUTOS,
        datas_saida=DATAS_SAIDA
    )

if __name__ == "__main__":
    main()