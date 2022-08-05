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

    def __salva_test(
        self,
        resultado_teste: float,
        nome_arquivo: str,
        numero: int
    ) -> None:
        arquivo = open(f"./start-py/data/{nome_arquivo}-{numero}.txt", "a")
        arquivo.write(str(resultado_teste)+"\n")
        arquivo.close()

    def teste_de_velocidade(self, maquina: str) -> None:
        # Start the stopwatch / counter
        t1_start = process_time()

        processamento = f"Num -> {self.__formata_valor_final(self.__soma())}"

        # Stop the stopwatch / counter
        t1_stop = process_time()

        print(processamento)

        resultado = t1_stop - t1_start

        self.__salva_test(
            resultado_teste=resultado,
            nome_arquivo=maquina,
            numero=self.__soma()
        )
        print(resultado)
