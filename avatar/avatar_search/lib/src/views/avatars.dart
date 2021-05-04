import 'package:avatar_search/src/components/avatar_list.dart';
import 'package:avatar_search/src/components/data_search_avatar.dart';
import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class Avatars extends StatelessWidget {
  Avatars({this.controller});
  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars Registrados'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: DataSearchAvatar(controller: controller));
                }),
          )
        ],
      ),
      body: AvatarList(controller: controller),
    );
  }
}
