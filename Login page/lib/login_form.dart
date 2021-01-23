import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_emailForm(), passwordForm()],
    );
  }

  Widget _emailForm() {
    return TextFormField(
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
    );
  }

  Widget passwordForm() {
    return Padding(
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
    );
  }
}
