import 'package:apptask/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginDB {
  _recuperarDataBase() async {
    final caminhoDB = await getDatabasesPath();
    final localDB = caminhoDB + 'local.db';

    return await openDatabase(
      join(
        await getDatabasesPath(),
        'users.db',
        localDB,
      ),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tb_user (
            'idUser INTEGER PRIMARY KEY AUTOINCREMENT',
             'nome TEXT NOT NULL',
            'email TEXT NOT NULL',
           'senha TEXT NOT NULL'
          )
        ''');
      },
    );
  }

  addUser(User user) async {
    Database db = await _recuperarDataBase();

    return await db.insert('tb_user', user.toMap());
  }

  updateUser(User user) async {
    Database db = await _recuperarDataBase();

    return await db.update('tb_user', user.toMap(),
        where: 'idUser = ?', whereArgs: [user.idUser]);
  }

  getUser(int id) async {
    Database db = await _recuperarDataBase();

    List<Map> users = await db.query('tb_user',
        columns: ['idUser', 'nome', 'email', 'senha'],
        where: 'idUser = ?',
        whereArgs: [id]);

    if (users.isNotEmpty) {
      var user = users.first;

      return User.fromMap(user);
    } else {
      return null;
    }
  }

  getUsuarioByLoginSenha(String login, String senha) async {
    Database db = await _recuperarDataBase();

    List<Map> usuarios = await db.query('tb_user',
        columns: ['idUser', 'nome', 'email', 'senha'],
        where: 'email = ? AND senha = ?',
        whereArgs: [login, senha]);

    if (usuarios.isNotEmpty) {
      var usuario = usuarios.first;

      return User.fromMap(usuario);
    } else {
      return null;
    }
  }

  getAllUser() async{
    Database db = await _recuperarDataBase();

    var result = await db.query('tb-user');
    List<User>? list = result.isNotEmpty ? result.map((e) => User.fromMap(e)).toList() : null;

    return list; 
  }

  deleteUser(int id) async {
    Database db = await _recuperarDataBase();

    return await db.delete('tb_user', 
     where: 'idUser = ?',
     whereArgs: [id] );
  }

  close() async{
    Database db = await _recuperarDataBase();

    db.close();
  }
}
