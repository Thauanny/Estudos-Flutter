import 'package:mobx/mobx.dart';

class HomeControllerManual {
  var _counter = Observable(0);
  late Action increment;

  HomeControllerManual() {
    increment = Action(_increment);
  }

  int get counter => _counter.value;

  set counter(int newValue) => _counter.value = newValue;

  _increment() {
    counter++;
  }
}
