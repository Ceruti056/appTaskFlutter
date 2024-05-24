import 'package:apptask/task.dart';
import 'package:apptask/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static const String _dbName = "Tasks.db";

  //Isntancia SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: 1,
        onCreate: (db, version) async =>
            await db.execute('''CREATE TABLE tableTask (
        idTask, $idType,
        titulo, $textType,
        descricao, $textType,
        dia_hora, $textType
      )'''
                '''CREATE TABLE tableUser(
        idUser, $idType,
        nome, $textType,
        email, $textType,
        senha, $textType
      )'''));
  }

  Future<int> addTask(Task task) async {
    final db = await _initDatabase();

    return await db.insert('tableTask', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTask(Task task) async {
    final db = await _initDatabase();

    return await db.update('Task', task.toJson(),
        where: 'idTask = ?',
        whereArgs: [task.idTask],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteTask(Task task) async {
    final db = await _initDatabase();

    return await db.delete(
      'Task',
      where: 'idTask = ?',
      whereArgs: [task.idTask],
    );
  }

  Future<List<Task>> getAllTask() async {
    final db = await _initDatabase();

    final List<Map<String, dynamic>> mapsTask = await db.query('Task');

    return List.generate(
        mapsTask.length, (index) => Task.fromJson(mapsTask[index]));
  }

  Future<int> addUser(User user) async {
    final db = await _initDatabase();

    return await db.insert('tableUser', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateUser(User user) async {
    final db = await _initDatabase();

    return await db.update('User', user.toJson(),
        where: 'idUser = ?',
        whereArgs: [user.idUser],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteUser(User user) async {
    final db = await _initDatabase();

    return await db.delete(
      'User',
      where: 'idUser = ?',
      whereArgs: [user.idUser],
    );
  }

  Future<List<User>?> getAllUser() async {
    final db = await _initDatabase();

    final List<Map<String, dynamic>> mapsUser = await db.query('User');

    if (mapsUser.isEmpty) {
      return null;
    }

    return List.generate(
        mapsUser.length, (index) => User.fromJson(mapsUser[index]));
  }
}
