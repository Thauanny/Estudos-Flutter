import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};
  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Digite o nome'),
                onSaved: (value) => _formData['name'] = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nome invalido.";
                  }

                  if (value.trim().length < 3) {
                    return "Nome pequeno demais, minimo 5 letras.";
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['email'],
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Digite o email'),
                onSaved: (value) => _formData['email'] = value,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 3) {
                    return "email invalido.";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration:
                    InputDecoration(labelText: 'Digite a url do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
