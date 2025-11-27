import requests
import pandas as pd
import time
import os
import re

# ================================
# CONFIGURAÇÕES
# ================================
EXCEL_PATH = r"C:\Users\CDG\Desktop\SISTEMAS\SCRIPTS\Retorna Produtos Bremen\Produtos Bremen - PageFlow (1).xlsx"         # caminho do arquivo Excel
COLUNA_ID = "N"             # nome da coluna que contém os IDs
TOKEN = "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5ESTFPRFk1TUgwLmVvcmd0bFBEbjFHRDZOeUU5RWxpcU5WaGlENmtLcXl6dy0wcGhtYXBfenc="             # token da API
URL_BASE = "http://192.168.1.10:9001/api/v1/caracteristicasproduto/"
AUTH_SCHEME = "Bearer"  # use 'Bearer' to match your other app; change to 'Token' if needed

# ================================
# LÊ O EXCEL
# ================================
# checa se o arquivo existe para evitar erros silenciosos e dar mensagem 
if not os.path.exists(EXCEL_PATH):
    raise FileNotFoundError(f"Arquivo Excel não encontrado: {EXCEL_PATH}")

df = pd.read_excel(EXCEL_PATH)

# Suporta COLUNA_ID tanto como nome de cabeçalho quanto como letra de coluna do Excel (ex: "L").
# Converte letra para índice quando apropriado.
def col_letter_to_index(letter: str) -> int:
    """Converte letras de coluna Excel (A, B, ..., Z, AA, AB, ...) para índice 0-based."""
    letter = letter.upper()
    if not re.match(r'^[A-Z]+$', letter):
        raise ValueError(f"'{letter}' não é uma letra de coluna válida")
    idx = 0
    for ch in letter:
        idx = idx * 26 + (ord(ch) - ord('A') + 1)
    return idx - 1

column_is_letter = False
col_idx = None
try:
    # se for apenas letras, tratamos como letra de coluna
    if re.match(r'^[A-Za-z]+$', COLUNA_ID):
        col_idx = col_letter_to_index(COLUNA_ID)
        column_is_letter = True
        if col_idx < 0 or col_idx >= df.shape[1]:
            raise Exception(f"Índice da coluna '{COLUNA_ID}' fora do intervalo do Excel (0..{df.shape[1]-1})")
    else:
        # se for nome de coluna, valida que exista no DataFrame
        if COLUNA_ID not in df.columns:
            raise Exception(f"A coluna '{COLUNA_ID}' não existe no arquivo Excel!")
except Exception:
    # re-raise com mensagem clara
    raise

# lista final com todas características
resultados = []

# ================================
# LOOP PARA CONSULTAR A API
# ================================
for index, row in df.iterrows():
    # se o usuário passou uma letra de coluna, acessamos por posição
    if column_is_letter:
        try:
            produto_id = row.iat[col_idx]
        except Exception as e:
            print(f"❗ Índice da coluna inválido na linha {index}: {e}; pulando")
            continue
    else:
        produto_id = row[COLUNA_ID]

    # ignora células vazias (print limitado para evitar ruído)
    if pd.isna(produto_id) or str(produto_id).strip() == "":
        if index < 5 or index % 50 == 0:
            print(f"⚠️ Linha {index}: ID vazio, pulando")
        continue

    # normaliza ID: converte floats inteiros (86.0) para '86' e remove espaços
    def normalize_id(val):
        if pd.isna(val):
            return None
        if isinstance(val, int):
            return str(val)
        if isinstance(val, float):
            if val.is_integer():
                return str(int(val))
            return str(val)
        s = str(val).strip()
        if re.match(r'^[0-9]+\.0$', s):
            return s.split('.')[0]
        return s

    produto_id = normalize_id(produto_id)
    if produto_id is None or produto_id == "":
        if index < 5 or index % 50 == 0:
            print(f"⚠️ Linha {index}: ID vazio depois da normalização, pulando")
        continue

    # converte produto_id para inteiro quando possível (API espera id integer)
    try:
        # já normalizamos '86.0' -> '86', mas aqui garantimos int
        id_param = int(float(produto_id))
    except Exception:
        print(f"❗ Linha {index}: ID '{produto_id}' não é um inteiro válido, pulando")
        continue

    params = {"id": id_param, "origem": 2}

    # Envia ambos headers: 'token' (conforme doc) e 'Authorization: Bearer ...' (como você usa noutra app)
    headers = {"token": TOKEN, "Authorization": f"Bearer {TOKEN}"}

    # Imprime token mascarado para debug (não exibe o token completo)
    def mask_token(t):
        s = str(t)
        if len(s) <= 12:
            return s
        return s[:6] + "..." + s[-4:]

    print(f"Consultando produto ID {id_param} (linha {index})... token={mask_token(TOKEN)}")

    try:
        # tenta algumas vezes se receber 401, porque pode haver variação por trás do serviço
        max_attempts = 3
        attempt = 1
        while True:
            response = requests.get(URL_BASE, headers=headers, params=params, timeout=10)
            if response.status_code != 401 or attempt >= max_attempts:
                break
            print(f"❗ Recebido 401 (Token inválido) — tentativa {attempt}/{max_attempts}, re-tentando em 1s")
            attempt += 1
            time.sleep(1)

        if response.status_code == 200:
            dados = response.json()
            resultados.append({
                "id_produto": produto_id,
                "caracteristicas": dados
            })
        else:
            print(f"❗ Erro no ID {produto_id}: HTTP {response.status_code} - {response.text}")
            resultados.append({
                "id_produto": produto_id,
                "caracteristicas": None,
                "erro": response.text
            })

    except Exception as e:
        print(f"❗ Erro ao consultar o ID {produto_id}: {e}")
        resultados.append({
            "id_produto": produto_id,
            "caracteristicas": None,
            "erro": str(e)
        })

    time.sleep(0.3)  # evita sobrecarregar o servidor

# ================================|
# EXPORTAR RESULTADO PARA JSON    |
# ================================|
pd.DataFrame(resultados).to_json("caracteristicas_produtos.json", orient="records", force_ascii=False)

print("\n✅ Finalizado! Arquivo salvo: caracteristicas_produtos.json")
