import 'package:flutter/material.dart';
import 'package:imc/app/repositories/currency_converter_repository.dart';
import 'package:imc/models/currency_model.dart';

class CurrencyPriceController {
  final repository = CurrencyConverterRepository();
  // error null
  CurrencyPriceModel? currencyPrice;
  final dollarController = TextEditingController();
  final euroController = TextEditingController();
  final realController = TextEditingController();

// error type CurrencyPriceModel
  Future<dynamic> getPrices() {
    return repository.getCurrenciesPrice();
  }

  void onRealChanged(text) {
    final doubleValue = double.tryParse(text) ?? 0.0;
    dollarController.text =
        (doubleValue / currencyPrice!.dollarPrice).toStringAsFixed(2);
    euroController.text =
        (doubleValue / currencyPrice!.euroPrice).toStringAsFixed(2);
  }

  void onDollarChanged(text) {
    final doubleValue = double.tryParse(text) ?? 0.0;
    realController.text =
        (doubleValue * currencyPrice!.dollarPrice).toStringAsFixed(2);
    euroController.text =
        (doubleValue * currencyPrice!.dollarPrice / currencyPrice!.euroPrice)
            .toStringAsFixed(2);
  }

  void onEuroChanged(text) {
    final doubleValue = double.tryParse(text) ?? 0.0;
    realController.text =
        (doubleValue * currencyPrice!.euroPrice).toStringAsFixed(2);
    dollarController.text =
        (doubleValue * currencyPrice!.euroPrice / currencyPrice!.dollarPrice)
            .toStringAsFixed(2);
  }
}
