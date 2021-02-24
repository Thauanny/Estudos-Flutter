import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();

    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 0.0;
    double retornarValue = 0;

    if (fromCurrency.name == "Real") {
      retornarValue = value * toCurrency.real;
    }
    if (fromCurrency.name == "Dolar") {
      retornarValue = value * toCurrency.dolar;
    }
    if (fromCurrency.name == "Euro") {
      retornarValue = value * toCurrency.euro;
    }
    if (fromCurrency.name == "Bitcoin") {
      retornarValue = value * toCurrency.bitcoin;
    }

    fromText.text = retornarValue.toStringAsFixed(2);
  }
}
