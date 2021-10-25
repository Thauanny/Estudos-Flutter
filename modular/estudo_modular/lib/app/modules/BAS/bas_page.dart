import 'package:flutter_modular/flutter_modular.dart';
import 'package:estudo_modular/app/modules/BAS/bas_store.dart';
import 'package:flutter/material.dart';

class BasPage extends StatefulWidget {
  final String title;
  const BasPage({Key? key, this.title = 'BasPage'}) : super(key: key);
  @override
  BasPageState createState() => BasPageState();
}
class BasPageState extends State<BasPage> {
  final BasStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}