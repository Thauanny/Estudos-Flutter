import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  List<String> dataList = ['', ''];
  List<String> showList = [];

  String model_name1;
  String model_name2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/currency.png',
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CurrencyBox(
                      selectedItem: homeController.toCurrency,
                      controller: toText,
                      items: homeController.currencies,
                      onChanged: (model) {
                        homeController.toCurrency = model;
                        model_name1 = model.name.toString();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CurrencyBox(
                    selectedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model;
                        model_name2 = model.name.toString();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      setState(() {
                        dataList[0] = "$model_name1" + ": " + "${toText.text}";

                        homeController.convert();

                        dataList[1] =
                            "$model_name2" + ": " + "${fromText.text}";

                        showList.addAll(dataList);
                      });
                    },
                    child: Text(
                      "Converter",
                      style: TextStyle(color: Colors.amber[900]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Text("Historico",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: showList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 60,
                          child: Card(
                              color: Colors.white,
                              child: Card(
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      '${showList[index]}',
                                      style:
                                          TextStyle(color: Colors.amber[900]),
                                    ),
                                  ))),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
