part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState.initial() => HomeState(
    fromCurrency: CurrencyModel(
      code: "USD",
      name: "United States Dollar",
      symbol: "\$",
      flag: "USD",
      number: 1,
      decimalDigits: 2,
      namePlural: "United States Dollars",
      symbolOnLeft: true,
      decimalSeparator: ".",
      thousandsSeparator: ",",
      spaceBetweenAmountAndSymbol: false,
    ),
    toCurrency: CurrencyModel(
      code: "UZS",
      name: "Uzbekistan Som",
      symbol: "so'm",
      flag: "UZS",
      number: 1,
      decimalDigits: 0,
      namePlural: "Uzbekistani Som",
      symbolOnLeft: false,
      decimalSeparator: "",
      thousandsSeparator: " ",
      spaceBetweenAmountAndSymbol: true,
    ),
  );
  
  const factory HomeState({
    required CurrencyModel fromCurrency,
    required CurrencyModel toCurrency,
    @Default("") String fromAmount,
    @Default("") String toAmount,
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeState;
}
