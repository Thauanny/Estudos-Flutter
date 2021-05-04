import 'package:avatar_search/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'allchars.dart';
import 'avatars.dart';

class HomePage extends StatelessWidget {
  HomePage({this.controller});
  HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icon.png",
                  fit: BoxFit.scaleDown,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              elevation: 25,
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Avatars(controller: controller)))
              },
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/avatars.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -0.7),
                        ),
                      )),
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Todos os Avatars",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              elevation: 25,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AllChars(controller: controller),
                  ),
                )
              },
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/all_char.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -0.7),
                        ),
                      )),
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Todos os Personagens",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
