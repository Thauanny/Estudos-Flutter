import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_route.dart';
import 'package:crud/views/user_form.dart';
import 'package:crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.blue),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USERFORM: (_) => UserForm(),
        },
      ),
    );
  }
}
