import requests
import json

reqUrl = "http://192.168.1.10:9001/api/v1/proposta/aprovar"

headersList = {
 "Accept": "*/*",
 "Authorization": "Bearer ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjFjM1ZoY21sdklqb2ljR0ZuWldac2IzY2lMQ0p1ZFcxbGNtOWZjMlZ5YVdVaU9pSXdNemc1TWlJc0ltVjRjQ0k2TVRjMk5ESTJPVFEyT1gwLkZOd1ZOQWVZUGNVdnFOQl9CV0FvSWVESnVFVEltRVc1R0VOTFF0cmh3bjA=",
 "Content-Type": "application/json"
}

payload = json.dumps({
    "identifier": "PageFlow",
    "data": {
    "id_orcamento": 226,
    "gerar_op": True,
    "itens": [
      {
         "id": 591
      },
            {
         "id": 592
      },
      
            {
         "id": 593
      }
      ,
            {
         "id": 594
      }
      ,
            {
         "id": 595
      }
      ,
            {
         "id": 596
      }
      ,
            {
         "id": 597
      }
,
            {
         "id": 598
      },
            {
         "id": 599
      },
            {
         "id": 600
      },
            {
         "id": 601
      },
            {
         "id": 602
      },
            {
         "id": 603
      }
    ]
  }
})

response = requests.request("POST", reqUrl, data=payload,  headers=headersList)

print(response.text)