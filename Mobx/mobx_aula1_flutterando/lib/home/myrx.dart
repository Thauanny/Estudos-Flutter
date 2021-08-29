import 'package:flutter/cupertino.dart';

class MyRx<T> implements Listenable {
  MyRx(T initalValue) : _value = initalValue;

  final _callBacks = <VoidCallback>[];

  T _value;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    _notifyListener(); // ao alterar o value notifica todas as funcoes armazenados no _callBacks
  }

  @override
  void addListener(VoidCallback listener) {
    _callBacks.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _callBacks.remove(listener);
  }

  void _notifyListener() {
    if (_callBacks.isEmpty) return;
    for (var _callback in _callBacks) {
      _callback();
    }
  }
}
