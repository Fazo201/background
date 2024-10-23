import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
    String code;
    String name;
    String symbol;
    String? flag;
    int number;
    int decimalDigits;
    String namePlural;
    bool symbolOnLeft;
    String decimalSeparator;
    String thousandsSeparator;
    bool spaceBetweenAmountAndSymbol;

    CurrencyModel({
        required this.code,
        required this.name,
        required this.symbol,
        this.flag,
        required this.number,
        required this.decimalDigits,
        required this.namePlural,
        required this.symbolOnLeft,
        required this.decimalSeparator,
        required this.thousandsSeparator,
        required this.spaceBetweenAmountAndSymbol,
    });

    CurrencyModel copyWith({
        String? code,
        String? name,
        String? symbol,
        String? flag,
        int? number,
        int? decimalDigits,
        String? namePlural,
        bool? symbolOnLeft,
        String? decimalSeparator,
        String? thousandsSeparator,
        bool? spaceBetweenAmountAndSymbol,
    }) => 
        CurrencyModel(
            code: code ?? this.code,
            name: name ?? this.name,
            symbol: symbol ?? this.symbol,
            flag: flag ?? this.flag,
            number: number ?? this.number,
            decimalDigits: decimalDigits ?? this.decimalDigits,
            namePlural: namePlural ?? this.namePlural,
            symbolOnLeft: symbolOnLeft ?? this.symbolOnLeft,
            decimalSeparator: decimalSeparator ?? this.decimalSeparator,
            thousandsSeparator: thousandsSeparator ?? this.thousandsSeparator,
            spaceBetweenAmountAndSymbol: spaceBetweenAmountAndSymbol ?? this.spaceBetweenAmountAndSymbol,
        );

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
        flag: json["flag"],
        number: json["number"],
        decimalDigits: json["decimalDigits"],
        namePlural: json["namePlural"],
        symbolOnLeft: json["symbolOnLeft"],
        decimalSeparator: json["decimalSeparator"],
        thousandsSeparator: json["thousandsSeparator"],
        spaceBetweenAmountAndSymbol: json["spaceBetweenAmountAndSymbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
        "flag": flag,
        "number": number,
        "decimalDigits": decimalDigits,
        "namePlural": namePlural,
        "symbolOnLeft": symbolOnLeft,
        "decimalSeparator": decimalSeparator,
        "thousandsSeparator": thousandsSeparator,
        "spaceBetweenAmountAndSymbol": spaceBetweenAmountAndSymbol,
    };
}
