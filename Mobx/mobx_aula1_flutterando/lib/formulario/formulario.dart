import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula1_flutterando/formulario/formulario_controller.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final controller = FormularioController();
  _textField(
      {required String labelText,
      required void Function(String value) onChange,
      required String? Function()? errorText}) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return _textField(
                        labelText: "Email",
                        onChange: (String value) {
                          controller.client.changeEmail(value);
                        },
                        errorText: controller.validateEmail);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) {
                    return _textField(
                        labelText: "Nome",
                        onChange: (String value) {
                          controller.client.changeName((value));
                        },
                        errorText: controller.validateName);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) {
                    return ElevatedButton(
                        onPressed: controller.isValid ? () {} : null,
                        child: Text("salvar"));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
