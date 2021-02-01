import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'custom_switch_theme.dart';
import 'menuBar.dart';

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
      drawer: Drawer(child: MenuBar()),
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
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.0),
            child: CurstomSwitchTheme(), // changeTheme
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 250.0),
                  child: Center(
                      child: Text("Contador: $counter",
                          style: Theme.of(context).textTheme.headline4)),
                ),
              ]),
        ], //children
      ),
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
