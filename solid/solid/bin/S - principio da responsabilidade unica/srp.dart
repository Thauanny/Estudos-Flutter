//uma classe deve ter apenas um motivo para mudar
//sua resposabilidade é sempre em cima de um e apenas um ator
class ContaCorrente {
  validarContaExistente() {
    //logica referente a conta corrente ok
  }

  salvarModificacoes() {
    //ferindo o principio pois fara conexoes referente a outros contextos criando acoplamento
  }
}

//correcao:

//um objeto nao pode e nao deve fazer mais do que o dominio dele
//ex: um produto nao deve ser capaz de exercer controle em um banco de dados

class ContaCorrenteRepository {
  void save() =>
      print; //salvando as informacoes correntemente sem gerar acoplamento desnessario e organizando o codigo
}

class contaCorrente2 {
  final ContaCorrenteRepository _repository =
      ContaCorrenteRepository(); //utilizar outro principio para corrigir esse acoplamento

  validarContaExistente() {
    //logica referente a conta corrente ok
  }

  salvarModificacoesNoBancoDeDados() {
    //delegando para a classe ContaCorrenteRepository a responsabilidade de exercer controle ao banco
    //já que é sua responsabilidade
    _repository.save();
  }
}
