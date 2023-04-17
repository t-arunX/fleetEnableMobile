import 'package:flutter_projects/widgets/todoApp/models/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Todo.dart';

enum Errors { incorrect, success, noUsers }

class Connection {
  Future getConnection() async {
    final path = await getDatabasesPath();
    String db = join(path, 'Todo_database.db');
    var connection = openDatabase(db);
    return connection;
  }

  createUserTable(String tableName) async {
    var db = await getConnection();
    await db.execute('''
            Create table IF NOT EXISTS $tableName(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                email VARCHAR(30) NOT NULL UNIQUE, 
                password VARCHAR(30) NOT NULL)
          ''');
  }

  createTodoTable(String tableName) async {
    var db = await getConnection();
    await db.execute('''
            Create table IF NOT EXISTS $tableName(
                todoId INTEGER PRIMARY KEY AUTOINCREMENT,
                text TEXT, 
                state BOOLEAN NOT NULL,
                id INTEGER,
                FOREIGN KEY(id) REFERENCES users(id)
                )
          ''');
  }

  dropTable(String tableName) async {
    var db = await getConnection();
    db.execute('''Drop table IF EXISTS $tableName''');
  }

  createInsert(String tableName, obj) async {
    await createUserTable(tableName);
    var db = await getConnection();
    int id = await db.insert(tableName, obj.toMap());
    return id;
  }

  deleteData(String tableName) async {
    var db = await getConnection();
    db.rawQuery('''
        delete from $tableName
    ''');
  }

  Future<dynamic> find(String? value) async {
    var db = await getConnection();
    var result =
        // await db.query("users", columns: ["id"], where: "email" ,whereArgs: [value]);
        await db.rawQuery('Select * from users where email like "$value"');
    return result;
  }

  Future<bool> exists(User user) async {
    String? email = user.email;
    var result = await find("$email");
    if (result.length != 0) {
      return true;
    }
    return false;
  }

  Future<bool> authPass(User user) async {
    String? email = user.email;
    String? password = user.password;
    password = password?.trim();
    var result = await find(email);
    String dbPassword = result[0]['password'];
    if (dbPassword == password) {
      return true;
    }
    return false;
  }

  Future<void> todoFormInsert(Todo todo) async {
    try {
      todo.text = todo.text?.trim();
      await createTodoTable("todo");
      var db = await getConnection();
      await db.insert("todo", todo.toMap());
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> todoFormUpdate(int checkBox, int id, int todoId) async {
    int? status;
    try {
      var db = await getConnection();
      status = await db.rawUpdate(
          'UPDATE todo SET state = $checkBox WHERE id = $id AND todoId = $todoId');
    } catch (ex) {
      print(ex);
    }
    // print(status);
    // getTodoList(1);
  }

  Future getTodoList(int id) async {
    var db = await getConnection();
    var result = await db.rawQuery('select * from todo where id = $id');
    // var result = await db.rawQuery('select * from todo');
    return result;
  }

  Future getUsers() async {
    var db = await getConnection();
    var result = await db.query('users');
    return result;
  }

  todoDelete(int id) async {
    var db = await getConnection();
    var res = db.rawQuery("delete from todo where todoId = $id");
  }
}


