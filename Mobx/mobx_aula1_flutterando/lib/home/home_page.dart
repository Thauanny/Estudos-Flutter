import 'package:flutter/material.dart';
import 'package:mobx_aula1_flutterando/home/counter_store.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = CounterStore();
  //final _counter = MyRx<int>(0);
  //final _counter = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    store.counter.addListener(() {
      print('${store.counter.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            AnimatedBuilder(
                animation: store.counter,
                builder: (_, __) {
                  return Text(
                    '${store.counter.value}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
