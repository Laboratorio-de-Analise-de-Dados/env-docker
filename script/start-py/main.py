from time import process_time

from src.inicio import Inicio


def teste_inicio() -> str:
    teste_entrada = True
    iniciando = Inicio(teste_entrada)
    teste_saida = iniciando.inicio

    if teste_saida:
        return "Sistema funcionando"

    return "Sistema não está funcionando"


def teste_de_velocidade(n: int) -> None:
    # Start the stopwatch / counter
    t1_start = process_time()

    soma = 0
    for i in range(n):
        soma += 1

    print(soma)

    # Stop the stopwatch / counter
    t1_stop = process_time()

    print("Elapsed time:", t1_stop, "s", t1_start, "s")

    print(
        "Elapsed time during the whole program in seconds:",
        t1_stop-t1_start, "s"
    )


if __name__ == "__main__":
    print(teste_inicio())

    teste_de_velocidade(n=100_000_000)
