/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final int id;
  final String? gender;
  final String? age;
  final String? aesthetic;
  final String? color;

  User(
      {required this.id,
      required this.gender,
      required this.age,
      required this.aesthetic,
      required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gender': gender,
      'age': age,
      'aesthetic': aesthetic,
      'color': color,
    };
  }
}

class UserDatabase {
  static final UserDatabase _instance = UserDatabase._internal();

  factory UserDatabase() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  UserDatabase._internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE User (id INTEGER PRIMARY KEY, gender TEXT, age TEXT, aesthetic TEXT, color TEXT)');
  }

  Future<int?> addUser(User user) async {
    var dbClient = await db;
    int? res = await dbClient?.insert("User", user.toMap());
    return res;
  }

    Future<int?> update(User user) async {
    Database? db = await instance.database;
    int id = user.toMap()['id'];
    return await db
        ?.update("User", user.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }
}*/
