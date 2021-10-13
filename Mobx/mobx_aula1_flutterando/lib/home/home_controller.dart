import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  int counter = 0;

  @observable
  String texto = '';

  @computed
  String get textoCounter => '$texto. Quantidade de vezes: $counter';

  @action
  increment() {
    counter++;
  }

  @action
  showTexOfInput(String value) {
    texto = value;
  }
}
