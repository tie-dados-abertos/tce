import os

script_path = "C:/Users/Eudes/Documents/scriptTce"

def percorrePastaRetornaListaSQL(caminho):
    if not os.path.exists(script_path):
        return "Este caminho não Existe."
    else:
        for diretorio,pasta,listaArquivo in os.walk(caminho):
            return [caminho+x for x in listaArquivo]

def converteScript(listaScript):
    for script in listaScript:
        arq = open(script, "r+b")
        lista = arq.readlines()
        print(lista)


converteScript(percorrePastaRetornaListaSQL(script_path))
