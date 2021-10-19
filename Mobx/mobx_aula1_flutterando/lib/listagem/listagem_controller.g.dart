// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListagemController on _ListagemControllerBase, Store {
  Computed<List<ItemModel>>? _$listFilteredComputed;

  @override
  List<ItemModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ItemModel>>(() => super.listFiltered,
              name: '_ListagemControllerBase.listFiltered'))
      .value;
  Computed<int>? _$totalCheckedComputed;

  @override
  int get totalChecked =>
      (_$totalCheckedComputed ??= Computed<int>(() => super.totalChecked,
              name: '_ListagemControllerBase.totalChecked'))
          .value;

  final _$listItensAtom = Atom(name: '_ListagemControllerBase.listItens');

  @override
  ObservableList<ItemModel> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(ObservableList<ItemModel> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$filterAtom = Atom(name: '_ListagemControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_ListagemControllerBaseActionController =
      ActionController(name: '_ListagemControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem(ItemModel item) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ItemModel item) {
    final _$actionInfo = _$_ListagemControllerBaseActionController.startAction(
        name: '_ListagemControllerBase.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_ListagemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItens: ${listItens},
filter: ${filter},
listFiltered: ${listFiltered},
totalChecked: ${totalChecked}
    ''';
  }
}
