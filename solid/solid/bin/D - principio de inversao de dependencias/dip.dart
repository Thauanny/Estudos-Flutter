//dip - depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print;
}

//problema: acoplamento, pois na contaCorrente dependemos da classe PagamentoRepository
//(nao é testavel, nao esta aberta para extensoes, nao é possivel implmentar o principio de liskov)
class ContaCorrente {
  PagamentoRepository? _repository;
  ContaCorrente() {
    _repository = PagamentoRepository();
  }

  void executarAlgumaLogica() {
    _repository!.save();
  }
}

//correção

abstract class IPagamentoRepository {
  save();
}

class PagamentoRepositoryImp implements IPagamentoRepository {
  //classe testavel
  @override
  save() {
    //metodo mockavel
  }
}

//sem instancias de uma outra classe, reduzindo o acoplamento.
//caso seja necessario extender o repository podera ser feito sem problemas, testavel

class ContaCorrente2 {
  IPagamentoRepository? _repository;
  ContaCorrente2(IPagamentoRepository repository) {
    _repository = repository;
  }

  void executarAlgumaLogica() {
    _repository!.save();
  }
}
