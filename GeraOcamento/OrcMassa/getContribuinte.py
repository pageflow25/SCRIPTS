import pandas as pd
import requests

df = pd.read_excel(r"C:\Users\CDG\Desktop\SISTEMAS\SCRIPTS\GeraOcamento\OrcMassa\cnpjs_resultado.xlsx")

def verificar_ie(cnpj):
    try:
        url = f"https://publica.cnpj.ws/cnpj/{cnpj}"
        r = requests.get(url, timeout=10)

        if r.status_code != 200:
            return "Erro"

        dados = r.json()

        # Pega lista de IEs
        inscricoes = dados.get("estabelecimento", {}).get("inscricoes_estaduais", [])

        if not inscricoes:
            return "NÃO POSSUI IE"

        # Pode haver várias IEs — pego a ativa
        for ie in inscricoes:
            if ie.get("ativo", False):
                return f"IE ATIVA: {ie.get('inscricao_estadual')}"

        # Se não tiver IE ativa, mas tiver IE cadastrada
        return f"IE INATIVA: {inscricoes[0].get('inscricao_estadual')}"

    except Exception:
        return "Erro"

# Aplicar
df["Inscrição Estadual"] = df["CNPJ"].apply(lambda c: verificar_ie(str(c).zfill(14)))

df.to_excel("resultado_ie.xlsx", index=False)

print("Consulta finalizada! Arquivo criado: resultado_ie.xlsx")
