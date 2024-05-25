import 'package:apptask/task.dart';
import 'package:apptask/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static const String _dbName = "Tasks.db";

  // Instância SQLite
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    return await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tableTask (
            idTask $idType,
            title $textType,
            description $textType,
            dia_hora $textType
          )
        ''');
        await db.execute('''
          CREATE TABLE tableUser (
            idUser $idType,
            nome $textType,
            email $textType,
            senha $textType
          )
        ''');
      },
    );
  }

  Future<int> addTask(Task task) async {
    final db = await database;

    return await db.insert('tableTask', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTask(Task task, Map<String, dynamic> dataToUpdate) async {
    final db = await database;

    return await db.update('tableTask', dataToUpdate,
        where: 'idTask = ?', whereArgs: [task.idTask]);
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;

    return await db.delete(
      'tableTask',
      where: 'idTask = ?',
      whereArgs: [task.idTask],
    );
  }

  Future<List<Task>> getAllTask() async {
    final db = await database;

    final List<Map<String, dynamic>> mapsTask = await db.query('tableTask');

    return List.generate(
        mapsTask.length, (index) => Task.fromJson(mapsTask[index]));
  }

  Future<int> addUser(User user) async {
    final db = await database;

    return await db.insert('tableUser', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateUser(User user, Map<String, dynamic> dataToUpdate) async {
    final db = await database;

    return await db.update('tableUser', dataToUpdate,
        where: 'idUser = ?', whereArgs: [user.idUser]);
  }

  Future<int> deleteUser(User user) async {
    final db = await database;

    return await db.delete(
      'tableUser',
      where: 'idUser = ?',
      whereArgs: [user.idUser],
    );
  }

  Future<List<User>> getAllUser() async {
    final db = await database;

    final List<Map<String, dynamic>> mapsUser = await db.query('tableUser');

    return List.generate(
        mapsUser.length, (index) => User.fromJson(mapsUser[index]));
  }
}
