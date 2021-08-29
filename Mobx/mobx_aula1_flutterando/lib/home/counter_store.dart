import 'package:flutter/cupertino.dart';

class CounterStore {
  final _counter = ValueNotifier<int>(0);

  void increment() {
    _counter.value++;
  }

  ValueNotifier<int> get counter => _counter;
}
