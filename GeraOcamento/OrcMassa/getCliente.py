import requests

# ==========================
# CONFIGURAÇÕES
# ==========================
reqUrlBase = "http://192.168.1.10:9001/api/v1/cliente"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5UVTJOREU0TTMwLmtSclVjNzU2aU1IX0VfY3pSSDhvSTI2eEhZYzI1OHZpMDUxbVJwdnNjNUk=",
 "Content-Type": "application/json"
}


# ==========================
# LISTA DE CNPJs ENVIADA
# ==========================
cnpjs_raw = """
26.083.507/0014-64
26.083.507/0015-45
17.308.306/0002-93
07.117.596/0001-53
07.622.613/0001-00
57.024.820/0003-00
57.024.820/0004-83
57.024.820/0006-45
57.024.820/0005-64
07.250.616/0008-36
07.250.616/0013-01
07.250.616/0004-02
07.250.616/0010-50
07.250.616/0006-74
07.250.616/0002-40
07.250.616/0001-60
07.250.616/0005-93
07.250.616/0003-21
07.250.616/0012-12
02.095.488/0002-94
26.083.507/0008-16
00.709.873/0007-63
19.213.316/0032-96
26.083.507/0010-30
14.011.425/0070-32
14.011.425/0067-37
14.011.425/0040-17
14.011.425/0077-09
14.011.425/0076-28
14.011.425/0057-65
14.011.425/0075-47
14.011.425/0068-18
28.935.567/0002-50
20.317.005/0001-50
14.011.425/0074-66
14.011.425/0004-53
17.160.713/0003-87
04.559.623/0002-30
04.559.623/0005-83
04.559.623/0006-64
04.559.623/0003-11
17.160.713/0002-04
02.852.848/0003-36
27.358.371/0002-87
29.445.572/0001-66
12.826.062/0001-36
03.953.723/0003-65
12.753.752/0004-55
12.753.752/0001-02
14.737.987/0001-36
19.213.316/0031-05
08.656.116/0001-95
22.613.895/0002-53
15.539.941/0004-18
40.345.365/0006-87
40.345.365/0005-04
40.345.365/0016-59
40.345.365/0008-49
40.345.365/0010-63
40.345.365/0012-25
40.345.365/0014-97
40.345.365/0001-72
00.709.873/0003-30
00.709.873/0001-78
12.909.103/0001-58
"""

# ==========================
# PREPARA LISTA
# ==========================
def clean_cnpj(cnpj):
    return cnpj.replace(".", "").replace("/", "").replace("-", "").strip()

cnpjs = [clean_cnpj(c) for c in cnpjs_raw.split("\n") if c.strip()]

# ==========================
# LISTAS DO RELATÓRIO
# ==========================
encontrados = []
nao_encontrados = []

# ==========================
# CONSULTA A API
# ==========================
for cnpj in cnpjs:
    url = f"{reqUrlBase}?cpfcnpj={cnpj}"
    print(f"Consultando {cnpj} ...")

    res = requests.get(url, headers=headersList)

    if res.status_code != 200:
        print(f"⚠️ Erro ao consultar {cnpj}: {res.status_code}")
        nao_encontrados.append(cnpj)
        continue

    data = res.json()

    if data.get("success") and data.get("data"):
        encontrados.append({
            "cnpj": cnpj,
            "dados": data["data"][0]
        })
    else:
        nao_encontrados.append(cnpj)

# ==========================
# RELATÓRIO FINAL
# ==========================
print("\n\n==============================")
print("RELATÓRIO FINAL")
print("==============================\n")

print("📌 CNPJs Encontrados:")
for item in encontrados:
    print(f"- {item['cnpj']} | Cliente: {item['dados'].get('razao_social')}")

print("\n❌ CNPJs NÃO Encontrados:")
for cnpj in nao_encontrados:
    print(f"- {cnpj}")

print("\n==============================")
print(f"Total enviados:      {len(cnpjs)}")
print(f"Encontrados:         {len(encontrados)}")
print(f"Não encontrados:     {len(nao_encontrados)}")
print("==============================\n")
