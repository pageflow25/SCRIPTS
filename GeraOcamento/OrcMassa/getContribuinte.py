import requests
import pandas as pd
import time

# ---------------------------------------------------------
# LISTA DE CNPJ + UF
# ---------------------------------------------------------
dados_brutos = """
26083507001464	SP
26083507001545	SP
17308306000293	SC
07117596000153	SC
07622613000100	SC
14011425004017	RJ
20317005000150	SP
14011425000453	RJ
12826062000136	AC
08656116000195	MS
22613895000253	RJ
15539941000418	RJ
57024820000300	SP
57024820000483	SP
57024820000645	SP
57024820000564	SP
07250616000836	CE
07250616001301	CE
07250616000402	CE
07250616001050	CE
07250616000674	CE
07250616000240	CE
07250616000160	CE
07250616000593	CE
07250616000321	CE
07250616001212	CE
02095488000294	RN
26083507000816	MT
00709873000763	SE
19213316003296	MG
26083507001030	MT
14011425007032	PR
14011425006737	DF
14011425007709	SP
14011425007628	MS
14011425005765	GO
14011425007547	SP
14011425006818	SC
28935567000250	PR
14011425007466	SP
17160713000387	DF
04559623000230	DF
04559623000583	DF
04559623000664	DF
04559623000311	DF
17160713000204	DF
02852848000336	GO
27358371000287	PB
29445572000166	AM
03953723000365	PE
12753752000455	RN
12753752000102	RN
14737987000136	MS
19213316003105	MS
40345365000687	RJ
40345365000504	RJ
40345365001659	RJ
40345365000849	RJ
40345365001063	RJ
40345365001225	RJ
40345365001497	RJ
40345365000172	RJ
00709873000330	DF
00709873000178	DF
12909103000158	MA
"""

# ---------------------------------------------------------
# PROCESSAMENTO DO TEXTO
# ---------------------------------------------------------
linhas = dados_brutos.strip().split('\n')
lista_consulta = []

for linha in linhas:
    partes = linha.split()
    if len(partes) >= 2:
        lista_consulta.append({
            'cnpj': partes[0].strip(),
            'uf': partes[1].strip()
        })

print(f"Iniciando consulta Speedio (versão estável) para {len(lista_consulta)} CNPJs...\n")

# ---------------------------------------------------------
# FUNÇÃO DE CONSULTA – VERSÃO ESTÁVEL
# ---------------------------------------------------------
def consultar_speedio(cnpj):

    url = f"https://speedio-tributos.vercel.app/api/buscar?cnpj={cnpj}"

    headers = {
        "User-Agent": "Mozilla/5.0"
    }

    for tentativa in range(3):  # tenta no máximo 3 vezes
        try:
            r = requests.get(url, headers=headers, timeout=20)
            
            if r.status_code != 200:
                time.sleep(1)
                continue

            data = r.json()

            # Resposta inválida
            if not isinstance(data, dict):
                continue

            # Se vier erro no JSON
            if "erro" in data:
                return None, data["erro"]

            ie = data.get("INSCRICAO_ESTADUAL")
            status = data.get("SITUACAO_CADASTRAL")

            if not ie:
                return None, "IE não disponível"

            return ie, status

        except Exception as e:
            print(f"  → tentativa {tentativa+1} falhou: {e}")
            time.sleep(1.5)

    return None, "Falha após 3 tentativas"

# ---------------------------------------------------------
# EXECUTA CONSULTAS
# ---------------------------------------------------------
resultados = []

for idx, item in enumerate(lista_consulta):
    cnpj = item['cnpj']
    uf = item['uf']

    ie, status = consultar_speedio(cnpj)

    print(f"[{idx+1}/{len(lista_consulta)}] {cnpj}: {ie} ({status})")

    resultados.append({
        "CNPJ": cnpj,
        "UF_Consultada": uf,
        "Inscricao_Estadual": ie if ie else "",
        "Status_Consulta": status
    })

    time.sleep(0.8)  # delay leve para evitar bloqueio

# ---------------------------------------------------------
# SALVA NO EXCEL
# ---------------------------------------------------------
df = pd.DataFrame(resultados)
df.to_excel("resultado_speedio.xlsx", index=False)

print("\n✔ Arquivo 'resultado_speedio.xlsx' gerado com sucesso!")
