import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  AvatarList({this.controller});

  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.avatars.length,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
