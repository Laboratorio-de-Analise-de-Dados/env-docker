from time import process_time


class TestadorVelocidade:

    def __init__(self, n: int) -> None:
        self.n = n

    def __soma(self) -> int:
        soma: int = 0
        for _ in range(self.n):
            soma += 1
        return soma

    def __formata_valor_final(self, valor: int) -> str:
        valor_final = f"{valor:_.0f}".replace("_", ".")
        return valor_final

    def __salva_test(self, resultado_teste: str) -> None:
        arquivo = open("./start-py/testando_velocidades.txt", "a")
        arquivo.write(resultado_teste+"\n")
        arquivo.close()

    def teste_de_velocidade(self, maquina: str) -> None:
        self.__salva_test(maquina)

        # Start the stopwatch / counter
        t1_start = process_time()

        processamento = f"Num -> {self.__formata_valor_final(self.__soma())}"

        # Stop the stopwatch / counter
        t1_stop = process_time()

        self.__salva_test(processamento)
        print(processamento)

        resultado = f"Var -> {t1_stop - t1_start:.4}s"
        self.__salva_test(resultado)
        print(resultado)
        self.__salva_test("------------------------\n")
