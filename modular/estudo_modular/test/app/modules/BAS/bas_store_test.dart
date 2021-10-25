import 'package:flutter_test/flutter_test.dart';
import 'package:estudo_modular/app/modules/BAS/bas_store.dart';
 
void main() {
  late BasStore store;

  setUpAll(() {
    store = BasStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}