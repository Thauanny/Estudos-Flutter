import 'package:flutter_modular/flutter_modular.dart';
import 'package:estudo_modular/app/modules/conection/conection_store.dart';
import 'package:flutter/material.dart';

class ConectionPage extends StatefulWidget {
  final String title;
  const ConectionPage({Key? key, this.title = 'ConectionPage'}) : super(key: key);
  @override
  ConectionPageState createState() => ConectionPageState();
}
class ConectionPageState extends State<ConectionPage> {
  final ConectionStore store = Modular.get();

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