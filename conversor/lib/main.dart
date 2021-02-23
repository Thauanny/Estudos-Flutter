import 'package:flutter/cupertino.dart'; //cupertino para ios
import 'package:flutter/material.dart';

import 'app/views/home_view.dart'; // material para android

main() => runApp(Appwidget());

class Appwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
