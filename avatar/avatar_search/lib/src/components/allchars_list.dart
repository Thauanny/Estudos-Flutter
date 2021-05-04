import 'package:flutter/material.dart';
import 'package:avatar_search/src/controllers/home_controller.dart';

class AllCharsList extends StatelessWidget {
  AllCharsList({this.controller});
  HomeController controller;

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.allchars.length,
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

                var character = controller.allchars[index];
                print(controller.allchars[index]);
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
                            height: 300, width: 300, child: showImg(character)),
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
    );
  }
}
