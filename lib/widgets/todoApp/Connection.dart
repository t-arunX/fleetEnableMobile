import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './models/User.dart';

class _Connection {
  Future getConnection() async {
    final path = await getDatabasesPath();
    String db = join(path, 'Todo_database.db');
    var connection = openDatabase(db);
    return connection;
  }

  createTable() async {
    var db = await getConnection();
    await db.execute('''
            Create table IF NOT EXISTS Users(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                email VARCHAR(30) NOT NULL UNIQUE, 
                password VARCHAR(30) NOT NULL)
          ''');
  }

  dropTable() async {
    var db = await getConnection();
    db.execute('''Drop table IF EXISTS users''');
  }

  createInsert(User user) async {
    await createTable();
    var db = await getConnection();
    await db.insert("users", user.toMap());
  }

  Future<dynamic> find(String? value) async {
    var db = await getConnection();
    var result =
        // await db.query("users", columns: ["id"], where: "email" ,whereArgs: [value]);
        await db.rawQuery('Select * from users where email like "$value"');
    return result;
  }

  Future<String> auth(User user) async {
    String? email = user.email;
    var result = await find(email);
    if (result.length != 0) {
      if (result.password == user.password) {
        return "Wrong password";
      } else {
        return "Success";
      }
    }
    return "No user exists";
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool? exists = prefs.getBool("login");
  // if (exists!) {
  //   //redirect into application
  // } else {
  //   // redirect into login page
  //   //verify user
  //   // on successful sign in store login status into prefs
  //   //redirect into Todoapp
  // }
  // _Connection().createTable();
  // _Connection().insertion(User(email:"tarun",password: "password"));
  // _Connection().find();
  // print(await _Connection().userExist("tarun"));
}

// runApp(
// MaterialApp(
// home: Scaffold(
// appBar: AppBar(
// title: const Text("Database demo"),
// ),
// drawer: Container(
// padding: EdgeInsets.all(20),
// color: Colors.cyan,
// child: const Text("help"),
// ),
// floatingActionButton: Container(
// child: GestureDetector(
// onTap: () {
// print("hai");
// },
// child: Container(
// padding: const EdgeInsets.all(15),
// decoration: const BoxDecoration(
// color: Colors.blueAccent,
// borderRadius: BorderRadius.all(Radius.circular(40))),
// child: const Icon(
// Icons.add,
// color: Colors.white,
// )),
// ),
// ),
// bottomNavigationBar: Container(
// padding: EdgeInsets.all(20),
// color: Colors.cyan,
// child: const Text("help"),
// ),
// ),
// ),
// );
