import requests
import json
import psycopg2
from psycopg2.extras import RealDictCursor
import sys
import os

# Tenta importar as configurações do arquivo config.py
try:
    from config import DB_CONFIG, API_BASE_URL, API_TOKEN, ESCOLA_ID_PADRAO
except ImportError:
    print("⚠️  Arquivo config.py não encontrado. Usando configurações padrão.")
    print("   Copie config.example.py para config.py e ajuste as configurações.\n")
    
    # Configuração padrão da conexão com o banco de dados
    DB_CONFIG = {
        'host': 'aws-1-sa-east-1.pooler.supabase.com',
        'database': 'postgres',
        'user': 'postgres.varvboeljxomurpzyqwr',
        'password': 'pvUsbXXoo1XlLrnE',
        'port': 6543
    }
    
    # Configuração padrão da API
    API_BASE_URL = "http://192.168.1.10:9001/api/v1"
    API_TOKEN = "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5ESTJPVFEyT1gwLkZOd1ZOQWVZUGNVdnFOQl9CV0FvSWVESnVFVEltRVc1R0VOTFF0cmh3bjA="
    ESCOLA_ID_PADRAO = 1

HEADERS = {
    "Accept": "*/*",
    "Authorization": API_TOKEN,
    "Content-Type": "application/json"
}


def conectar_banco():
    """Estabelece conexão com o banco de dados PostgreSQL"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"❌ Erro ao conectar ao banco de dados: {e}")
        sys.exit(1)


def buscar_dados_formulario(formulario_id):
    """
    Executa a query para buscar id_produto e data_saida do formulário
    """
    query = """
    SELECT ef.id_produto, dm.data_saida 
    FROM public.arquivo_pdfs ap, 
         public.distribuicao_materiais dm, 
         public.especificacoes_form ef, 
         public.formularios f
    WHERE dm.arquivo_pdf_id = ap.id 
      AND ap.item_pedido_id = ef.id 
      AND ap.formulario_id = f.id 
      AND f.id = %s
    """
    
    conn = conectar_banco()
    try:
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute(query, (formulario_id,))
        resultado = cursor.fetchone()
        cursor.close()
        conn.close()
        
        if resultado:
            print(f"✅ Dados do formulário encontrados:")
            print(f"   - ID Produto: {resultado['id_produto']}")
            print(f"   - Data Saída: {resultado['data_saida']}")
            return resultado
        else:
            print(f"❌ Nenhum dado encontrado para o formulário ID: {formulario_id}")
            return None
    except Exception as e:
        print(f"❌ Erro ao executar query: {e}")
        conn.close()
        return None


def gerar_json_orcamento(id_produto, data_saida, escola_id=None):
    """
    Executa o SQL do orçamento com os parâmetros fornecidos
    """
    # Lê o arquivo SQL
    sql_path = os.path.join(os.path.dirname(__file__), 'sql_orcamento.sql')
    
    try:
        with open(sql_path, 'r', encoding='utf-8') as f:
            sql_query = f.read()
    except Exception as e:
        print(f"❌ Erro ao ler o arquivo SQL: {e}")
        return None
    
    # Substitui os placeholders :nome por %(nome)s para psycopg2
    sql_query = sql_query.replace(':escola_id', '%(escola_id)s')
    sql_query = sql_query.replace(':id_produto', '%(id_produto)s')
    sql_query = sql_query.replace(':data_saida', '%(data_saida)s')
    
    conn = conectar_banco()
    try:
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        
        # Define escola_id padrão se não fornecido
        if escola_id is None:
            escola_id = ESCOLA_ID_PADRAO
        
        # Executa a query com os parâmetros
        cursor.execute(sql_query, {
            'escola_id': escola_id,
            'id_produto': id_produto,
            'data_saida': data_saida
        })
        
        resultado = cursor.fetchone()
        cursor.close()
        conn.close()
        
        if resultado and resultado.get('json_build_object'):
            json_orcamento = resultado['json_build_object']
            print(f"✅ JSON do orçamento gerado com sucesso")
            return json_orcamento
        else:
            print(f"❌ Não foi possível gerar o JSON do orçamento")
            return None
    except Exception as e:
        print(f"❌ Erro ao executar SQL do orçamento: {e}")
        conn.close()
        return None


def criar_orcamento(json_payload):
    """
    Envia o JSON para a API e cria um orçamento
    """
    url = f"{API_BASE_URL}/orcamento"
    
    try:
        response = requests.post(
            url,
            data=json.dumps(json_payload),
            headers=HEADERS,
            timeout=30
        )
        
        if response.status_code == 200:
            resultado = response.json()
            print(f"✅ Orçamento criado com sucesso!")
            print(f"   - ID Orçamento: {resultado['data']['id_orcamento']}")
            print(f"   - Total de itens: {len(resultado['data']['itens'])}")
            return resultado['data']
        else:
            print(f"❌ Erro ao criar orçamento. Status: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return None
    except Exception as e:
        print(f"❌ Erro ao chamar API de orçamento: {e}")
        return None


def aprovar_proposta(id_orcamento, itens):
    """
    Aprova a proposta usando o ID do orçamento e os IDs dos itens
    """
    url = f"{API_BASE_URL}/proposta/aprovar"
    
    # Monta a lista de itens para aprovação
    itens_aprovacao = [{"id": item["id"]} for item in itens]
    
    payload = {
        "identifier": "PageFlow",
        "data": {
            "id_orcamento": id_orcamento,
            "gerar_op": True,
            "itens": itens_aprovacao
        }
    }
    
    try:
        response = requests.post(
            url,
            data=json.dumps(payload),
            headers=HEADERS,
            timeout=30
        )
        
        if response.status_code == 200:
            resultado = response.json()
            print(f"✅ Proposta aprovada com sucesso!")
            print(f"   Resposta: {json.dumps(resultado, indent=2, ensure_ascii=False)}")
            return resultado
        else:
            print(f"❌ Erro ao aprovar proposta. Status: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return None
    except Exception as e:
        print(f"❌ Erro ao chamar API de aprovação: {e}")
        return None


def processar_formulario(formulario_id, escola_id=None, auto_aprovar=False):
    """
    Função principal que executa todo o fluxo de automação
    
    Args:
        formulario_id: ID do formulário a ser processado
        escola_id: ID da escola (opcional)
        auto_aprovar: Se True, aprova automaticamente a proposta
    """
    print("=" * 60)
    print(f"🚀 Iniciando processamento do formulário ID: {formulario_id}")
    print("=" * 60)
    
    # Passo 1: Buscar dados do formulário
    print("\n📋 Passo 1: Buscando dados do formulário...")
    dados_formulario = buscar_dados_formulario(formulario_id)
    if not dados_formulario:
        return False
    
    id_produto = dados_formulario['id_produto']
    data_saida = dados_formulario['data_saida']
    
    # Passo 2: Gerar JSON do orçamento
    print("\n📋 Passo 2: Gerando JSON do orçamento...")
    json_orcamento = gerar_json_orcamento(id_produto, data_saida, escola_id)
    if not json_orcamento:
        return False
    
    # Passo 3: Criar orçamento na API
    print("\n📋 Passo 3: Criando orçamento na API...")
    resultado_orcamento = criar_orcamento(json_orcamento)
    if not resultado_orcamento:
        return False
    
    id_orcamento = resultado_orcamento['id_orcamento']
    itens_orcamento = resultado_orcamento['itens']
    
    # Passo 4: Aprovar proposta (se solicitado)
    if auto_aprovar:
        print("\n📋 Passo 4: Aprovando proposta...")
        resultado_aprovacao = aprovar_proposta(id_orcamento, itens_orcamento)
        if not resultado_aprovacao:
            return False
    else:
        print("\n⚠️  Aprovação automática desabilitada.")
        print(f"   Para aprovar manualmente, use:")
        print(f"   - ID Orçamento: {id_orcamento}")
        print(f"   - IDs dos Itens: {[item['id'] for item in itens_orcamento]}")
    
    print("\n" + "=" * 60)
    print("✅ Processamento concluído com sucesso!")
    print("=" * 60)
    return True


if __name__ == "__main__":
    # Verifica se o ID do formulário foi passado como argumento
    if len(sys.argv) < 2:
        print("❌ Uso: python app.py <formulario_id> [escola_id] [--aprovar]")
        print("\nExemplos:")
        print("  python app.py 322")
        print("  python app.py 322 1")
        print("  python app.py 322 1 --aprovar")
        sys.exit(1)
    
    formulario_id = int(sys.argv[1])
    escola_id = int(sys.argv[2]) if len(sys.argv) > 2 and sys.argv[2].isdigit() else None
    auto_aprovar = '--aprovar' in sys.argv
    
    # Executa o processamento
    sucesso = processar_formulario(formulario_id, escola_id, auto_aprovar)
    
    sys.exit(0 if sucesso else 1)
