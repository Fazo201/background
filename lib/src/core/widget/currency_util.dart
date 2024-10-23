import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:currency_picker/currency_picker.dart';

class CurrencyUtil {
  static CurrencyModel currencyToCurrencyModel(Currency currency) {
    return CurrencyModel(
      code: currency.code,
      name: currency.name,
      symbol: currency.symbol,
      flag: currency.flag,
      number: currency.number,
      decimalDigits: currency.decimalDigits,
      namePlural: currency.namePlural,
      symbolOnLeft: currency.symbolOnLeft,
      decimalSeparator: currency.decimalSeparator,
      thousandsSeparator: currency.thousandsSeparator,
      spaceBetweenAmountAndSymbol: currency.spaceBetweenAmountAndSymbol,
    );
  }

  static String currencyToEmoji(String currencyCode) {
    const base = 127397;

    return String.fromCharCodes(currencyCode.codeUnits.map((e) => base + e));
  }
}
