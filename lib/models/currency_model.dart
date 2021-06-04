class CurrencyPriceModel {
  double dollarPrice;
  double euroPrice;

  // error required
  CurrencyPriceModel({required this.dollarPrice, required this.euroPrice});

  factory CurrencyPriceModel.fromMap(Map<String, dynamic> map) {
    return CurrencyPriceModel(
      dollarPrice: double.tryParse(map['USDBRL']['low']) ?? 0.0,
      euroPrice: double.tryParse(map['EURBRL']['low']) ?? 0.0,
    );
  }
}
