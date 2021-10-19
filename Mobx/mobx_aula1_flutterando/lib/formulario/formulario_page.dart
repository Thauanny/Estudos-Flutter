import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_aula1_flutterando/components/item_widget.dart';
import 'package:mobx_aula1_flutterando/formulario/formulario_controller.dart';
import 'package:mobx_aula1_flutterando/listagem/listagem_page.dart';
import 'package:provider/provider.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
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
    // final controller =
    // Provider.of<FormularioController>(context); //utiliando provider
    final controller = GetIt.I.get<FormularioController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text("Next Page"),
              InkWell(
                  child: Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Listagem()))),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Container(
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
                          onPressed: controller.isValid
                              ? () {
                                  if (controller.validateLogin()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('sucesso'),
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('email diferente de eu@.com'),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                }
                              : null,
                          child: Text("salvar"));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
