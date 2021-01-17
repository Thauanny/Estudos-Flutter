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
        title: Text("Home Page"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Column herda de flex que herda multichildrender -> childers[multelements]
        Center(
            child: Text("Contador: $counter", style: TextStyle(fontSize: 40))),
        SwitchListTile(
            secondary: const Icon(Icons.lightbulb_outline),
            title: const Text('Change Theme'),
            value: AppController.instance.isDarkTheme,
            onChanged: (value) => AppController.instance.changeTheme()),
      ]),
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () => setState(() => counter++)),
    );
  } //Build
} // HomePage
