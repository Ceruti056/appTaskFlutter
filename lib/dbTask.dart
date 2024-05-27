import 'package:apptask/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Instância SQLite
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      version: 1,
      onCreate: (db, version) async {
       await db.execute('''
          CREATE TABLE tb_task (
            'idTask INTEGER PRIMARY KEY AUTOINCREMENT',
             'title TEXT NOT NULL',
            'description TEXT NOT NULL',
           'dia_hora TEXT NOT NULL'
          )
        ''');
      },
    );
  }

  Future<int> addTask(Task task) async {
    final db = await database;

    return await db.insert('tb_task', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTask(Task task, Map<String, dynamic> dataToUpdate) async {
    final db = await database;

    return await db.update(
       'tb_task', 
       dataToUpdate,
       where: 'idTask = ?', 
       whereArgs: [task.idTask]);
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;

    return await db.delete(
      'tb_task',
      where: 'idTask = ?',
      whereArgs: [task.idTask],
    );
  }

  Future<List<Task>> getAllTask() async {
    final db = await database;

    final List<Map<String, dynamic>> mapsTask = await db.query('tb_task');

    return List.generate(
        mapsTask.length, (index) => Task.fromJson(mapsTask[index]));
  }

  
}
