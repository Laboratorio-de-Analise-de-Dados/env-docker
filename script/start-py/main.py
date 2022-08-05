from src.inicio import Inicio
from src.testador_velocidade import TestadorVelocidade


def teste_inicio() -> str:
    teste_entrada = True
    iniciando = Inicio(teste_entrada)
    teste_saida = iniciando.inicio

    if teste_saida:
        return "Sistema funcionando"

    return "Sistema não está funcionando"


if __name__ == "__main__":
    print(teste_inicio())

    for _ in range(1_000):
        teste = TestadorVelocidade(n=1_000_000)
        teste.teste_de_velocidade(maquina="t2.2xlarge")
