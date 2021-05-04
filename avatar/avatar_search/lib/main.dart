import 'package:avatar_search/src/views/home_page.dart';
import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    print(controller.avatars.length);
    return MaterialApp(
      title: 'Personagens de: Avatar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Personagens de: Avatar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  Widget get _success {
    return HomePage(controller: controller);
  }

  Widget get _error {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tente Novamente'),
      ),
    );
  }

  Widget get _loading {
    return Center(child: CircularProgressIndicator());
  }

  Widget get _start {
    return Container();
  }

  stateManagement<Widget>(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start;
      case HomeState.error:
        return _error;
      case HomeState.loading:
        return _loading;
      case HomeState.sucess:
        return _success;
      default:
        return _start;
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        child: Text("Teste"),
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
