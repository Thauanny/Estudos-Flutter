import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/44787914?s=400&u=f66aff70ff6f68596d127bb9533470cf64d402f7&v=4',
            ),
          ),
          accountName: Text('Usuario'),
          accountEmail: Text('Usuario@email.com'),
        ),
        Card(
          child: ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Icon(Icons.list_alt_sharp),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text("Listar",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
              onTap: () => Navigator.popAndPushNamed(context, '/list')),
        ),
        Card(
            child: ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Icon(Icons.settings),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 49),
                  child: Text("Configurações",
                      style: TextStyle(color: Colors.blue, fontSize: 18)),
                ),
                onTap: () {})),
        Card(
          child: ListTile(
              trailing: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Icon(Icons.logout),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text("Sair",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
              onTap: () => Navigator.pushReplacementNamed(context, '/')),
        ),
      ],
    );
  }
}
