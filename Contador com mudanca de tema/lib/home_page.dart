import 'package:Projeto1/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contador",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Column herda de flex que herda multichildrender -> childers[multelements]
        Center(
            child: Text("Contador: $counter",
                style: Theme.of(context).textTheme.headline4)),
        SwitchListTile(
            secondary: const Icon(Icons.lightbulb_outline),
            title: Text('Change Theme',
                style: Theme.of(context).textTheme.subtitle1),
            value: AppController.instance.isDarkTheme,
            onChanged: (value) => AppController.instance.changeTheme()),
      ]),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () => setState(() => counter++),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  } //Build
} // HomePage
