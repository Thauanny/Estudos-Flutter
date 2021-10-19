// OCP nos informa que devemos ser capazes de extender um comportamento de classe, sem precisar modifica-la
class Pagamento {
  void pagarBoleto() => print;
  void pagarImposto() => print;
  // e caso precise adicionar um novo tipo de pagamento? sera necessario modifcar a classe para pode adicionar portantp:

}

abstract class pagamento2 {
  int valor = 20;
  pagar();
}

class PagamentoBoleto extends pagamento2 {
  @override
  pagar() {
    // TODO: implement pagar
    throw UnimplementedError();
  }
}

class PagamentoImposto extends pagamento2 {
  @override
  pagar() {
    // TODO: implement pagar
    throw UnimplementedError();
  }
}

class PagamentoDebito extends pagamento2 {
  @override
  pagar() {
    // TODO: implement pagar
    throw UnimplementedError();
  }
}

class PagamentoCredito extends pagamento2 {
  @override
  pagar() {
    // TODO: implement pagar
    throw UnimplementedError();
  }
}
// na implementação sera feita os tratamentos e usada a que mais se adequa sem precisar modifcar a classe
