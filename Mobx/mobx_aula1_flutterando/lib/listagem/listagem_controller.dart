import 'package:mobx/mobx.dart';
import 'package:mobx_aula1_flutterando/listagem/models/item_model.dart';
part 'listagem_controller.g.dart';

class ListagemController = _ListagemControllerBase with _$ListagemController;

abstract class _ListagemControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItens = [
    ItemModel(title: 'titulo 1', check: true),
    ItemModel(title: 'titulo 2', check: false),
    ItemModel(title: 'titulo 3', check: true)
  ].asObservable();

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return listItens;
    } else {
      return listItens
          .where((element) =>
              element.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @computed
  int get totalChecked =>
      listItens.where((element) => element.check == true).length;

  @action
  addItem(ItemModel item) => listItens.add(item);

  @action
  removeItem(ItemModel item) {
    listItens.removeWhere((element) => element.title == item.title);
  }
}
