import 'dart:convert';

import 'package:currency_app/src/data/entity/currency_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBServer {
  static final DBServer _instance = DBServer._init();
  static Database? _database;

  DBServer._init();

  factory DBServer() {
    return _instance;
  }

  Future<Database> get _db async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('currency.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE currencies (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fromCurrency TEXT,
            toCurrency TEXT,
            fromAmount TEXT,   
            toAmount TEXT     
          )
        ''');
      },
    );
  }

  Future<int> insertCurrency(CurrencyModel fromCurrency, CurrencyModel toCurrency, String fromAmount, String toAmount) async {
    final db = await _db;

    final data = {
      'fromCurrency': jsonEncode(fromCurrency.toJson()),
      'toCurrency': jsonEncode(toCurrency.toJson()),  
      'fromAmount': fromAmount,
      'toAmount': toAmount,
    };

    return db.insert(
      'currencies',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<Map<String, dynamic>?> getLastCurrency() async {
    final db = await _db;
    
    final result = await db.query(
      'currencies',
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      final fromCurrencyJson = jsonDecode(result.first['fromCurrency'] as String);
      final toCurrencyJson = jsonDecode(result.first['toCurrency'] as String);
      final fromCurrency = CurrencyModel.fromJson(fromCurrencyJson);
      final toCurrency = CurrencyModel.fromJson(toCurrencyJson);

      return {
        'fromCurrency': fromCurrency,
        'toCurrency': toCurrency,
        'fromAmount': result.first['fromAmount'],
        'toAmount': result.first['toAmount'],
      };
    } else {
      return null;
    }
  }

  Future close() async {
    final db = await _db;
    db.close();
  }
}
