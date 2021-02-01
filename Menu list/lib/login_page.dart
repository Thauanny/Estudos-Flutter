import 'package:Projeto1/btnValidation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  int password;
  final _formKey = GlobalKey<FormState>();
  final _snackBarKey = GlobalKey<ScaffoldState>();

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/login.png',
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: Text('Login',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
                Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: LoginForm()),
                btnForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btnForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        width: 100.0,
        height: 50.0,
        child: ElevatedButton(
          onPressed: () {
            btnValidation(_formKey, context, _snackBarKey, '/home');
          },
          child: Text('Login', style: Theme.of(context).textTheme.headline6),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          _body()
        ],
      ),
    );
  }
}
