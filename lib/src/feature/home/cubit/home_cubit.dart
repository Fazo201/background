import 'dart:developer';

import 'package:currency_app/src/core/widget/currency_util.dart';
import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:currency_app/src/data/repository/app_repository.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRepo appRepo;
  HomeCubit(this.appRepo) : super(HomeState.initial());

  Future<void> loadLastCurrencyData() async {
    log("loadCurrencyData");
    final lastCurrencyData = await appRepo.getLastCurrencyData();
    log(lastCurrencyData.toString());
    if (lastCurrencyData != null) {
      emit(state.copyWith(
        fromCurrency: lastCurrencyData["fromCurrency"],
        toCurrency: lastCurrencyData["toCurrency"],
        fromAmount: lastCurrencyData["fromAmount"]??"",
        toAmount: lastCurrencyData["toAmount"]??"",
      ));
    }
  }

  Future<void> writeCurrencyData({
    required CurrencyModel fromCurrency,
    required CurrencyModel toCurrency,
    required String fromAmount,
    required String toAmount,
  }) async {
    await appRepo.writeLastCurrencyData(fromCurrency, toCurrency, fromAmount, toAmount);
    // await loadLastCurrencyData();
  }

  Future<void> updateAmount(String amount) async {
    log("updateAmount");
    emit(state.copyWith(fromAmount: amount, isLoading: true));
    try {
      final model = await appRepo.convertCurrency(
        from: state.fromCurrency.code,
        to: state.toCurrency.code,
        amount: amount,
      );
      if (model?.success == true) {
        emit(state.copyWith(toAmount: "${model?.result??state.toAmount}"));
      } else {
        emit(state.copyWith(toAmount: "${model?.error?.info}"));
      }
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void changeFromCurrency(Currency currency) {
    log("changeFromCurrency");
    final fromCurrency = CurrencyUtil.currencyToCurrencyModel(currency);
    emit(state.copyWith(fromCurrency: fromCurrency));
    updateAmount(state.fromAmount);
  }

  void changeToCurrency(Currency currency) {
    log("changeToCurrency");
    final toCurrency = CurrencyUtil.currencyToCurrencyModel(currency);
    emit(state.copyWith(toCurrency: toCurrency));
    updateAmount(state.fromAmount);
  }

  void switchCurrencies() {
    log("switchCurrencies");
    final fromCurrency = state.fromCurrency;
    final toCurrency = state.toCurrency;
    final fromAmount = state.fromAmount;
    final toAmount = state.toAmount;
    emit(state.copyWith(
      fromCurrency: toCurrency,
      toCurrency: fromCurrency,
      fromAmount: toAmount,
      toAmount: fromAmount,
    ));
  }
}
