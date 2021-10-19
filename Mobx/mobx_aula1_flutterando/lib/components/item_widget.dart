import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:mobx_aula1_flutterando/listagem/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key, required this.item, required this.removedClicked})
      : super(key: key);
  final ItemModel item;
  final Function removedClicked;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        title: Text(item.title),
        leading: Checkbox(
          value: item.check,
          onChanged: (bool? value) {
            item.setCheck(value!);
          },
        ),
        trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              removedClicked(item);
            }),
      ),
    );
  }
}
