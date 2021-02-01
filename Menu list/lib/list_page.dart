import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem", style: Theme.of(context).textTheme.headline6),
      ),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(top: 50.0),
              margin: EdgeInsets.only(left: 20.0),
              child: Text("Lista - ",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontStyle: FontStyle.italic))),
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Card(
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
          ),
        ],
      ),
    );
  }
}
