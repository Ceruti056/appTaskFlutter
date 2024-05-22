import 'package:apptask/task.dart';
import 'package:apptask/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDataBase {
  static final NotesDataBase instance = NotesDataBase._init();
  static Database? _database;

  NotesDataBase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(filePath, dbPath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableTask (
        ${NoteFieldTask.idTask} $idType,
        ${NoteFieldTask.titulo}, $textType,
        ${NoteFieldTask.descricao}, $textType,
        ${NoteFieldTask.dia_hora}, $textType
      )'''
        '''CREATE TABLE $tableUser(
        ${NoteFieldUser.idUser} $idType,
        ${NoteFieldUser.nome}, $textType,
        ${NoteFieldUser.email}, $textType,
        ${NoteFieldUser.senha}, $textType
      )''');
  }

  Future<User> createUser(User user) async {
    final db = await instance.database;
    // final jsonUser = user.toJson();

    // final columns = '${NoteFieldUser.nome}, ${NoteFieldUser.email}, ${NoteFieldUser.senha}';
    // final values = '${jsonUser[NoteFieldUser.nome]}, ${jsonUser[NoteFieldUser.email]}, ${jsonUser[NoteFieldUser.senha]}';

    // final id = await db.rawInsert('INSERT INTO table_user ($columns) VALUES ($values)');

    final idUser = await db.insert(tableTask, user.toJson());
    return user.copy(idUser: idUser);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;
   
    final maps = await db.query(
      tableUser,
      columns: NoteFieldTask.values,
      where: '${NoteFieldTask.idTask} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return User.fromJson(maps.first);
    }
    else{
      throw Exception('Id $id não foi encontrado');
    }
  }

  Future<Task> createTask(Task task) async {
    final db = await instance.database;
    // final jsonTask = task.toJson();

    // final columns = '${NoteFieldTask.titulo}, ${NoteFieldTask.descricao}, ${NoteFieldTask.dia_hora}';
    // final values = '${jsonTask[NoteFieldTask.titulo]}, ${jsonTask[NoteFieldTask.descricao]}, ${jsonTask[NoteFieldTask.dia_hora]}';

    // final id = await db.rawInsert('INSERT INTO table_task ($columns) VALUES ($values)');

    final idTask = await db.insert(tableTask, task.toJson());
    return task.copy(idTask: idTask);
  }

  Future<Task> readTask(int id) async {
    final db = await instance.database;
   
    final maps = await db.query(
      tableTask,
      columns: NoteFieldTask.values,
      where: '${NoteFieldTask.idTask} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Task.fromJson(maps.first);
    }
    else{
      throw Exception('Id $id não foi encontrado');
    }
  }

  Future<List<Task>> readAllTasks() async{
    final db = await instance.database;

    final orderBy = '${NoteFieldTask.dia_hora} ASC';

    // final result =
    //   await db.rawQuery('SELECT * FROM $tableTask ORDER BY $orderBy');
    final result = await db.query(tableTask, orderBy: orderBy);
    

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
