// isp - muitas interfaces especificas sao melhores que uma geral
abstract class Conta {
  void deposito(int val) => print;
  void transferencia(int val) => print;
  void emprestimo() => print;
}

//problema: dependemos de Conta e conta nos oferece mais do que utilizamos
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

abstract class Conta2 {
  void deposito();
}

abstract class ServicosEntreConta {
  tranferancia();
  emprestimo();
}

class ContaCorrente2 extends Conta2 implements ServicosEntreConta {
  @override
  void deposito() {
    // TODO: implement deposito
  }

  @override
  emprestimo() {
    // TODO: implement emprestimo
  }

  @override
  tranferancia() {
    // TODO: implement tranferancia
  }
}

class ContaPoupanca2 extends Conta2 {
  @override
  void deposito() {
    // TODO: implement deposito
  }
}

class ContaUniversitaria extends Conta2 implements ServicosEntreConta {
  @override
  void deposito() {
    // TODO: implement deposito
  }

  @override
  emprestimo() {
    // TODO: implement emprestimo
  }

  @override
  tranferancia() {
    // TODO: implement tranferancia
  }
}

main() {
  // utilizar as abstracaoes

  realizarDesposito(Conta2 conta, int value) {
    conta.deposito();
  }

  realizarTransferencia(ServicosEntreConta conta, int value) {
    conta.tranferancia();
  }
}
