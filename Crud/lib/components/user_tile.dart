import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return Card(
      child: ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.USERFORM, arguments: user);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Excluir Usuario'),
                            content: Text(' Tem certeza?'),
                            actions: [
                              FlatButton(
                                child: Text('Não',
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              FlatButton(
                                  child: Text(
                                    'Sim',
                                    style: TextStyle(color: Colors.red[900]),
                                  ),
                                  onPressed: () {
                                    Provider.of<Users>(context, listen: false)
                                        .remove(user);
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
