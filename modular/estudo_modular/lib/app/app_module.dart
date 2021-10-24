import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override

  //controle das injeções
  final List<Bind> binds = [
    Bind.instance<String>('instance'),
    Bind.singleton((i) => AppController(i()))
  ];

  @override
  //controle das rotas
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}

class AppController {
  final String name;
  AppController(this.name);
}
