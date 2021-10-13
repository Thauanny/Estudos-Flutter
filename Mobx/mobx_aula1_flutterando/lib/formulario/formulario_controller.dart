import 'package:mobx/mobx.dart';
import 'package:mobx_aula1_flutterando/models/client.dart';
part 'formulario_controller.g.dart';

class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  Client client = Client();

  String? validateEmail() {
    if (client.email.isEmpty) {
      return 'Campo Obrigatorio';
    } else {
      return null;
    }
  }
}
