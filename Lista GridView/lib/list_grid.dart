import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
