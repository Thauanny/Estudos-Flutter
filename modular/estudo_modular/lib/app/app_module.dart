import 'package:estudo_modular/app/modules/BAS/bas_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  //exportar instacia de modulos filhos para irmaos
  @override
  final List<Module> imports = [BasModule()];

  @override
  //controle das injeções
  final List<Bind> binds = [
    Bind.instance<String>('instance'),
  ];

  @override
  //controle das rotas
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
