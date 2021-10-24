import 'package:estudo_modular/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModule(AppModule());

  group('teste controller', () {
    test('controller test', () {
      final appController = Modular.get<AppController>();
    });
  });
}
