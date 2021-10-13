import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula1_flutterando/formulario/formulario.dart';
import 'package:mobx_aula1_flutterando/home/counter_store.dart';
import 'package:mobx_aula1_flutterando/home/home_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  //final store = CounterStore();
  //final _counter = MyRx<int>(0);
  //final _counter = ValueNotifier<int>(0);
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    //store.counter.addListener(() {
    // print('${store.counter.value}');
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              child: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Formulario()))),
        ],
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text('${controller.counter}');
            }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Digite algo"),
                    onChanged: (String value) =>
                        controller.showTexOfInput(value),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.textoCounter}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
