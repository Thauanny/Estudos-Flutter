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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 2.0),
            child: CurstomSwitchTheme(),
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
          Container(
              padding: EdgeInsets.only(top: 250.0),
              margin: EdgeInsets.only(left: 20.0),
              child: Text("Lista - ",
                  style: Theme.of(context).textTheme.headline4)),
          Container(
            padding: EdgeInsets.only(top: 300.0),
            child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(100, (index) {
                  /* para ver exemplo usando array : http://www.macoratti.net/19/07/flut_gridv1.htm*/
                  return Center(
                      child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.amberAccent,
                  ));
                })),
          ),
          Stack(
            children: [
              Container(
                //padding: EdgeInsets.only(top: 300.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              )
            ],
          ),
        ],
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
