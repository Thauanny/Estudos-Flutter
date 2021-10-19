//lsp - uma classe deve ser substituivel pelos seus tipos base
abstract class Conta {
  void deposito(int val) => print;
  void transferencia(int val) => print;
  void emprestimo() => print;
}

class ContaCorrente implements Conta {
  @override
  void emprestimo() {
    // TODO: implement realizarEmprestimo
  }

  @override
  void deposito(int val) {
    // TODO: implement deposito
  }

  @override
  void transferencia(int val) {
    // TODO: implement transferencia
  }
}

class ContaPoupanca implements Conta {
  @override
  void emprestimo() {
    throw Exception('Poupanca nao suporta emprestimo');
  }

  @override
  void deposito(int val) {
    // TODO: implement deposito
  }

  @override
  void transferencia(int val) {
    throw Exception('Poupança nao suporta transferencia');
  }
}

main() {
  // utilizar as abstracaoes

  realizarDesposito(Conta conta, int value) {
    conta.deposito(value);
  }

  realizarTransferencia(Conta conta, int value) {
    conta.transferencia(
        value); // veja que ira gerar erro ao transferir de poupanca
    //proximo principio ira corrigir
  }
}
