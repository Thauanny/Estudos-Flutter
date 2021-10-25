import 'package:estudo_modular/app/modules/conection/conection_Page.dart';
import 'package:estudo_modular/app/modules/conection/conection_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConectionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConectionStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ConectionPage()),
  ];
}
