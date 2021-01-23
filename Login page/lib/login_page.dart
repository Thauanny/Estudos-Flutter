import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  int password;
  final _formKey = GlobalKey<FormState>();
  final _snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _snackBarKey,
      body: SingleChildScrollView(
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
                  TextFormField(
                    key: ValueKey('formEmaillKey'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      key: ValueKey('formPasswordlKey'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            _snackBarKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                "Não foi possivel validar, tente novamente.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        child: Text('Login',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
