import 'package:avatar_search/src/components/allchars_list.dart';
import 'package:avatar_search/src/components/data_search_all.dart';
import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class AllChars extends StatelessWidget {
  AllChars({this.controller});
  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens registrados'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: DataSearchAll(controller: controller));
                }),
          )
        ],
      ),
      body: AllCharsList(
        controller: controller,
      ),
    );
  }
}
