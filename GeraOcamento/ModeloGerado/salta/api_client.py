"""
Módulo de cliente para comunicação com as APIs de Orçamento e Proposta
"""
import requests
import json
import logging
import os
from datetime import datetime
from typing import Dict, Any, List, Optional
from dotenv import load_dotenv

# Carregar variáveis de ambiente
load_dotenv()

logger = logging.getLogger(__name__)


class APIClient:
    """Cliente para comunicação com as APIs de Orçamento e Aprovação"""
    
    def __init__(self):
        """Inicializa o cliente da API"""
        self.base_url = os.getenv('API_BASE_URL', 'http://192.168.1.10:9001/api/v1')
        self.token = 'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UZ3lPVGcyTm4wLmZOblVCeGpid2VHeWVkcEJndFVIWmVZZmNyNFhCUWtiX2FIcGYyeWd2dFE='
        
        if not self.token:
            raise ValueError("API_TOKEN não configurado no arquivo .env")
        
        self.headers = {
            "Accept": "*/*",
            "Authorization": f"Bearer {self.token}",
            "Content-Type": "application/json"
        }
    
    def criar_orcamento(self, payload: Dict[str, Any]) -> Dict[str, Any]:
        """
        Envia requisição para criar um orçamento
        
        Args:
            payload: Dados do orçamento no formato esperado pela API
            
        Returns:
            Resposta da API contendo id_orcamento e itens
            
        Raises:
            Exception: Se houver erro na requisição
        """
        url = f"{self.base_url}/orcamento"
        
        try:
            logger.info(f"Enviando requisição de criação de orçamento para {url}")
            logger.debug(f"Payload: {json.dumps(payload, indent=2, ensure_ascii=False)}")
            
            response = requests.post(
                url,
                data=json.dumps(payload, ensure_ascii=False),
                headers=self.headers,
                timeout=60
            )
            
            # Log da resposta
            logger.info(f"Status da resposta: {response.status_code}")
            
            # Verificar se a requisição foi bem sucedida
            response.raise_for_status()
            
            # Parsear resposta JSON
            response_data = response.json()
            
            # Verificar se a resposta indica sucesso
            if response_data.get('success'):
                logger.info(f"✓ Orçamento criado com sucesso - ID: {response_data['data']['id_orcamento']}")
                return response_data
            else:
                error_msg = response_data.get('message', 'Erro desconhecido')
                logger.error(f"✗ API retornou erro: {error_msg}")
                raise Exception(f"Erro na API: {error_msg}")
                
        except requests.exceptions.RequestException as e:
            logger.error(f"✗ Erro na requisição HTTP: {e}")
            if hasattr(e, 'response') and e.response is not None:
                logger.error(f"Resposta do servidor: {e.response.text}")
            raise
        except json.JSONDecodeError as e:
            logger.error(f"✗ Erro ao decodificar resposta JSON: {e}")
            raise
    
    def aprovar_proposta(self, id_orcamento: int, itens_aprovacao: List[Dict[str, Any]], 
                        gerar_op: bool = True) -> Dict[str, Any]:
        """
        Envia requisição para aprovar uma proposta
        
        Args:
            id_orcamento: ID do orçamento a ser aprovado
            itens_aprovacao: Lista de itens com id e data_entrega
            gerar_op: Se deve gerar OP automaticamente
            
        Returns:
            Resposta da API contendo informações da aprovação
            
        Raises:
            Exception: Se houver erro na requisição
        """
        url = f"{self.base_url}/proposta/aprovar"
        
        payload = {
            "identifier": "PageFlow",
            "data": {
                "id_orcamento": id_orcamento,
                "gerar_op": gerar_op,
                "itens": itens_aprovacao
            }
        }
        
        try:
            logger.info(f"Enviando requisição de aprovação de proposta para {url}")
            logger.info(f"Orçamento ID: {id_orcamento}, Itens: {len(itens_aprovacao)}")
            logger.debug(f"Payload: {json.dumps(payload, indent=2, ensure_ascii=False)}")
            
            response = requests.post(
                url,
                data=json.dumps(payload, ensure_ascii=False),
                headers=self.headers,
                timeout=60
            )
            
            # Log da resposta
            logger.info(f"Status da resposta: {response.status_code}")
            
            # Verificar se a requisição foi bem sucedida
            response.raise_for_status()
            
            # Parsear resposta JSON
            response_data = response.json()
            
            # Verificar se a resposta indica sucesso
            if response_data.get('success'):
                logger.info(f"✓ Proposta aprovada com sucesso - Orçamento ID: {id_orcamento}")
                return response_data
            else:
                error_msg = response_data.get('message', 'Erro desconhecido')
                logger.error(f"✗ API retornou erro: {error_msg}")
                raise Exception(f"Erro na API: {error_msg}")
                
        except requests.exceptions.RequestException as e:
            logger.error(f"✗ Erro na requisição HTTP: {e}")
            if hasattr(e, 'response') and e.response is not None:
                logger.error(f"Resposta do servidor: {e.response.text}")
            raise
        except json.JSONDecodeError as e:
            logger.error(f"✗ Erro ao decodificar resposta JSON: {e}")
            raise
    
    @staticmethod
    def formatar_data_entrega(data: str) -> str:
        """
        Formata uma data para o formato esperado pela API
        
        Args:
            data: Data no formato 'YYYY-MM-DD' ou 'YYYY-MM-DDTHH:MM:SS'
            
        Returns:
            Data formatada no padrão ISO 8601 com timezone
        """
        try:
            # Se já está no formato completo com timezone, retorna como está
            if 'T' in data and ('-03:00' in data or '+00:00' in data):
                return data
            
            # Se é apenas data, adiciona hora padrão e timezone
            if 'T' not in data:
                data = f"{data}T09:00:00-03:00"
            # Se tem hora mas não tem timezone
            elif '-03:00' not in data and '+00:00' not in data:
                data = f"{data}-03:00"
            
            return data
        except Exception as e:
            logger.error(f"Erro ao formatar data '{data}': {e}")
            # Retorna data com valor padrão em caso de erro
            return f"{data}T09:00:00-03:00"
    
    def validar_payload_orcamento(self, payload: Dict[str, Any]) -> bool:
        """
        Valida se o payload de orçamento está no formato correto
        
        Args:
            payload: Payload a ser validado
            
        Returns:
            True se válido, False caso contrário
        """
        try:
            # Verificar estrutura básica
            assert 'identifier' in payload, "Campo 'identifier' ausente"
            assert 'data' in payload, "Campo 'data' ausente"
            
            data = payload['data']
            assert 'id_cliente' in data, "Campo 'id_cliente' ausente"
            assert 'id_vendedor' in data, "Campo 'id_vendedor' ausente"
            assert 'id_forma_pagamento' in data, "Campo 'id_forma_pagamento' ausente"
            assert 'itens' in data, "Campo 'itens' ausente"
            assert len(data['itens']) > 0, "Lista de itens vazia"
            
            # Validar cada item
            for idx, item in enumerate(data['itens']):
                assert 'id_produto' in item, f"Item {idx}: Campo 'id_produto' ausente"
                assert 'descricao' in item, f"Item {idx}: Campo 'descricao' ausente"
                assert 'quantidade' in item, f"Item {idx}: Campo 'quantidade' ausente"
                assert 'componentes' in item, f"Item {idx}: Campo 'componentes' ausente"
            
            logger.info("✓ Payload de orçamento validado com sucesso")
            return True
            
        except AssertionError as e:
            logger.error(f"✗ Validação do payload falhou: {e}")
            return False
