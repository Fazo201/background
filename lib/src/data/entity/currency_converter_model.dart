import 'dart:convert';

CurrencyConverterModel currencyConverterModelFromJson(String str) => CurrencyConverterModel.fromJson(json.decode(str));

String currencyConverterModelToJson(CurrencyConverterModel data) => json.encode(data.toJson());

class CurrencyConverterModel {
    bool? success;
    String? terms;
    String? privacy;
    Query? query;
    Info? info;
    double? result;
    Error? error;

    CurrencyConverterModel({
        this.success,
        this.terms,
        this.privacy,
        this.query,
        this.info,
        this.result,
        this.error,
    });

    factory CurrencyConverterModel.fromJson(Map<String, dynamic> json) => CurrencyConverterModel(
        success: json["success"],
        terms: json["terms"],
        privacy: json["privacy"],
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        result: json["result"]?.toDouble(),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "terms": terms,
        "privacy": privacy,
        "query": query?.toJson(),
        "info": info?.toJson(),
        "result": result,
        "error": error?.toJson(),
    };
}

class Error {
    int? code;
    String? info;

    Error({
        this.code,
        this.info,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        info: json["info"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "info": info,
    };
}

class Info {
    int? timestamp;
    double? quote;

    Info({
        this.timestamp,
        this.quote,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        timestamp: json["timestamp"],
        quote: json["quote"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "quote": quote,
    };
}

class Query {
    String? from;
    String? to;
    double? amount;

    Query({
        this.from,
        this.to,
        this.amount,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        from: json["from"],
        to: json["to"],
        amount: json["amount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "amount": amount,
    };
}
