import 'package:currency_app/src/core/server/notification_server.dart';
import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:currency_app/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:workmanager/workmanager.dart';

const taskName = "fetchCurrencyTask";

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  Workmanager().registerPeriodicTask(
    "currencyTask",
    taskName,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
  );
  await NotificationServer.init();
  tz.initializeTimeZones();
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == taskName) {
      final appRepo = AppRepoImpl();
      final lastCurrencyData = await appRepo.getLastCurrencyData();

      if (lastCurrencyData != null) {
        final CurrencyModel fromCurrency = lastCurrencyData["fromCurrency"];
        final CurrencyModel toCurrency = lastCurrencyData["toCurrency"];
        final String fromAmount = lastCurrencyData["fromAmount"];
        final String toAmount = lastCurrencyData["toAmount"];

        final convertCurrency = await appRepo.convertCurrency(
          from: fromCurrency.code,
          to: toCurrency.code,
          amount: fromAmount,
        );

        if (convertCurrency?.success == true && convertCurrency?.result.toString() != toAmount) {
          await NotificationServer.showNotification(
            "Currency Rate Update",
            "$fromAmount ${fromCurrency.code} changed to ${convertCurrency?.result} ${toCurrency.code}"
          );
          await appRepo.writeLastCurrencyData(fromCurrency, toCurrency, fromAmount, convertCurrency?.result.toString()??toAmount);
        }
      }
    }

    return Future.value(true);
  });
}
