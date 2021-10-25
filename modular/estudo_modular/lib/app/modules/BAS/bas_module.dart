import 'package:estudo_modular/app/modules/BAS/bas_Page.dart';
import 'package:estudo_modular/app/modules/BAS/bas_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<bool>(true, export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BasPage()),
  ];
}
