import 'package:dio/dio.dart';
import 'package:imc/models/currency_model.dart';

// error type CurrencyPriceModel
class CurrencyConverterRepository {
  Future<dynamic> getCurrenciesPrice() async {
    try {
      final dio = Dio();
      final res = await dio
          .get('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL');
      if (res.statusCode == 200) {
        return CurrencyPriceModel.fromMap(res.data);
      }
    } catch (err) {
      throw Exception('Valor não retornado pela API');
    }
  }
}
