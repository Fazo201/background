import 'package:currency_app/src/data/entity/currency_converter_model.dart';
import 'package:currency_app/src/data/entity/currency_model.dart';

abstract class AppRepo {
  Future<CurrencyConverterModel?> convertCurrency({required String from,required String to,required String amount});

  Future<Map<String, dynamic>?> getLastCurrencyData();

  Future<void> writeLastCurrencyData(CurrencyModel fromCurrency,CurrencyModel toCurrency, String fromAmount, String toAmount);
}