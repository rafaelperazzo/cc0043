import json

import requests

link = "https://primeiro-1b090-default-rtdb.firebaseio.com/"

requisicao = requests.get(f'{link}/usuarios/.json')
#print(requisicao)
dic_requisicao = requisicao.json()
id_alon = None
for id_usuario in dic_requisicao:
    cliente = dic_requisicao[id_usuario]['nome']
    print(cliente)

dados = {'nome': 'Joao', 'email': 'joao@ufca.edu.br'}
requisicao = requests.post(f'{link}/usuarios/.json', data=json.dumps(dados))
print(requisicao)
print(requisicao.text)