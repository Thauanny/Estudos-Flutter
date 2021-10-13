import 'package:mobx/mobx.dart';
import 'package:mobx_aula1_flutterando/models/client.dart';
part 'formulario_controller.g.dart';

class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  Client client = Client();

  @computed
  bool get isValid {
    return validateEmail() == null && validateName() == null;
  }

  String? validateEmail() {
    if (client.email.isEmpty) {
      return 'Campo Obrigatorio';
    } else if (!client.email.contains("@")) {
      return 'Não é um email valido';
    } else {
      return null;
    }
  }

  String? validateName() {
    if (client.name.isEmpty) {
      return 'Campo Obrigatorio';
    } else if (client.name.length < 3) {
      return 'Necessario mais do que 3 caracteres';
    } else {
      return null;
    }
  }
}
