import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State <HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body:Center(
          child:
          Text('Contador: $counter', style: TextStyle(fontSize: 40)),
          ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => setState( () => counter++) ),
    );
  } //Build
} // HomePage