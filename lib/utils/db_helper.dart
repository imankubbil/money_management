import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:money_management/models/user.dart';
import 'package:money_management/models/bank.dart';
import 'package:money_management/models/category.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get db async{
    if(_database != null){
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }
  DatabaseHelper.internal();

  initDB() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "money_management.db");
    var ourDB = await openDatabase(path, version: 1, onCreate:_onCreate);
    return ourDB;
  }

  void _onCreate(Database db, int version ) async {
    await db.execute("CREATE TABLE User ("
    "id INTEGER PRIMARY KEY, "
    "username TEXT, "
    "name TEXT, "
    "password TEXT"")");

    print("TABLE USER IS CREATED");

    await db.execute("CREATE TABLE Bank ("
    "id INTEGER PRIMARY KEY, "
    "name TEXT, "
    "saldo TEXT, "
    "username TEXT "")");

    print("TABLE BANK IS CREATED");

    await db.execute("CREATE TABLE Category ("
    "id INTEGER PRIMARY KEY, "
    "name TEXT, "
    "percent TEXT,"
    "username TEXT "")");

    print("TABLE CATEGORY IS CREATED");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int response = await dbClient.insert("User", user.toMap());
    return response;
  }

  Future<User?> checkLogin(String username, String password) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM User Where username = '$username' AND password = '$password'");
    if( result.length > 0) {
      return User.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int response = await dbClient.delete("User");
    return response;
  }

  Future<int> saveBank(Bank bank) async {
    var dbClient = await db;
    int response = await dbClient.insert("Bank", bank.toMap());
    return response;
  }

  Future<Bank?> getBank(String username) async {
    print(username);
    var dbClient = await db;
    var result = await dbClient.rawQuery(
      "SELECT * FROM Bank WHERE username = '$username'");
    print(result);
    if( result.length > 0) {
      print(result.first);
      return Bank.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteBank() async {
    var dbClient = await db;
    int response = await dbClient.delete("Bank");
    return response;
  }

  Future<int> saveCategory(Category category) async {
    var dbClient = await db;
    int response = await dbClient.insert("Category", category.toMap());
    return response;
  }
}