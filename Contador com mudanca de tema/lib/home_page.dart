import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_switch_theme.dart';

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
        title: Text("Contador", style: Theme.of(context).textTheme.headline6),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.home)),
                Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.settings)),
              ],
            ),
          )
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Column herda de flex que herda multichildrender -> childers[multelements]
        Center(
            child: Text("Contador: $counter",
                style: Theme.of(context).textTheme.headline4)),
        CurstomSwitchTheme(),
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
