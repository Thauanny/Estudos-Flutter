import 'package:flutter/material.dart';

btnValidation(_formKey, context, _snackBarKey, route) {
  if (_formKey.currentState.validate()) {
    Navigator.of(context).pushReplacementNamed(route);
  } else {
    _snackBarKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Não foi possivel validar, tente novamente.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
