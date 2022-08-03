from src.inicio import Inicio

def teste_inicio() -> str:
    teste_entrada = True
    iniciando = Inicio(teste_entrada)
    teste_saida = iniciando.inicio

    if teste_saida:
        return "Sistema funcionando"
    
    return "Sistema não está funcionando"


if __name__ == "__main__":
    print(teste_inicio())
    