import 'package:flutter_modular/flutter_modular.dart';

class OtherModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => AppController(i()))];

  @override
  final List<ModularRoute> routes = [];
}

class AppController {
  final String name;
  AppController(this.name);
}
