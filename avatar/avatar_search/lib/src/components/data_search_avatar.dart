import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class DataSearchAvatar extends SearchDelegate<String> {
  DataSearchAvatar({this.controller});
  HomeController controller;
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on left
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // results
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.avatars.length,
              // ignore: missing_return
              itemBuilder: (context, index) {
                showImg(var char) {
                  try {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        char.photoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                          if (char.photoUrl == null) {
                            return Image.network(
                              'https://img.icons8.com/ios/452/no-image.png',
                              fit: BoxFit.cover,
                            );
                          }
                          return Image.network(
                            'https://img.icons8.com/ios/452/no-image.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  } catch (e) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        'https://img.icons8.com/ios/452/no-image.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                }

                var character = controller.avatars[index];

                if (controller.avatars[index].name
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    controller.avatars[index].name == query.toLowerCase()) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Container(
                              height: 300,
                              width: 300,
                              child: showImg(character)),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ListTile(
                          title: Center(
                              child: Text(
                            character.name,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              title: Text(''),
            ));
  }
}
