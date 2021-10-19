import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_aula1_flutterando/components/item_widget.dart';
import 'package:mobx_aula1_flutterando/listagem/listagem_controller.dart';
import 'package:mobx_aula1_flutterando/listagem/models/item_model.dart';

class Listagem extends StatelessWidget {
  Listagem({Key? key}) : super(key: key);
  final controller = GetIt.I.get<ListagemController>();

  _dialog(BuildContext context) {
    ItemModel item = ItemModel(title: '', check: false);
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('adicionar item'),
              content: TextField(
                onChanged: (value) {
                  item.setTitle(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Novo item'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      controller.addItem(item);
                      Navigator.pop(context);
                    },
                    child: Text('salvar')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancelar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.setFilter('');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (String value) {
              controller.setFilter(value);
            },
            decoration: InputDecoration(hintText: "Pesquisar"),
          ),
          actions: [
            Observer(
              builder: (_) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(controller.totalChecked.toString()),
                ));
              },
            )
          ],
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemBuilder: (_, index) {
              var item = controller.listFiltered[index];
              return ItemWidget(
                item: item,
                removedClicked: controller.removeItem,
              );
            },
            itemCount: controller.listFiltered.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _dialog(context);
          },
        ),
      ),
    );
  }
}
