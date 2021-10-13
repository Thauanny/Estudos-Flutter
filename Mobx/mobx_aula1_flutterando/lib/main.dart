import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'formulario/formulario_controller.dart';
import 'home/home_page.dart';

void main() {
  GetIt getit = GetIt.I;
  getit.registerSingleton<FormularioController>(FormularioController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        /*MultiProvider(
      providers: [
        Provider<FormularioController>(create: (_) => FormularioController())
      ],
      child:*/
        MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // ), //utilizando provider
    );
  }
}
