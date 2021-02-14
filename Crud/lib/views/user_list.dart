import 'package:crud/components/user_tile.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Users'),
      ),
      body: users.count != 0
          ? ListView.builder(
              itemCount: users.count,
              itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
            )
          : Center(
              child: Text("Sem usuarios"),
            ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(
            height: 50.0,
          )),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.USERFORM)},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
