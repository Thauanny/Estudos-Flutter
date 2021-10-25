import 'package:flutter_test/flutter_test.dart';
import 'package:estudo_modular/app/modules/conection/conection_store.dart';
 
void main() {
  late ConectionStore store;

  setUpAll(() {
    store = ConectionStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}