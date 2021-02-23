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
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/currency.png',
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: CurrencyBox(
                    selectedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model;
                      });
                    },
                  ),
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
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      homeController.convert();
                    },
                    child: Text(
                      "Converter",
                      style: TextStyle(color: Colors.amber[900]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
