import 'dart:developer';

import 'package:currency_app/src/core/server/api.dart';
import 'package:currency_app/src/core/server/db_server.dart';
import 'package:currency_app/src/data/entity/currency_converter_model.dart';
import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:currency_app/src/data/repository/app_repository.dart';

class AppRepoImpl extends AppRepo {
  final DBServer _db = DBServer();
  final String accessKey = "f1856d456f77b8e499672d56c96ed091";
  // d87a3aed80858746f2632e254c5e7615   
  // f1856d456f77b8e499672d56c96ed091  NEW
  
  @override
  Future<CurrencyConverterModel?> convertCurrency({required String from, required String to,required String amount}) async {
    log("getConvertCurrency");
    try {
      String? str = await Api.get(
        api: Api.apiConvert,
        params: {
          "access_key":accessKey,
          "from": from,
          "to": to,
          "amount": amount,
        },
      );
      if (str != null) {
        log("Response: $str");
        CurrencyConverterModel currencyConverterModel = currencyConverterModelFromJson(str);
        return currencyConverterModel;
      } else {
        return null;
      }
    } catch (e) {
      log("AppRepoImpl getConvertCurrency: $e");
      return null;
    }
  }
  
  @override
  Future<Map<String, dynamic>?> getLastCurrencyData() async{
    log("getLastCurrencyData");
    Map<String, dynamic>? data = await _db.getLastCurrency();
    return data;
  }
  
  @override
  Future<void> writeLastCurrencyData(CurrencyModel fromCurrency,CurrencyModel toCurrency,String fromAmount, String toAmount) async{
    log("writeLastCurrencyData");
    await _db.insertCurrency(fromCurrency, toCurrency,fromAmount,toAmount);
  }

}
