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

  CreateInsert(User user) async {
    await createTable();
    var db = await getConnection();
    await db.insert("users", user.toMap());
  }

  find() async {
    var db = await getConnection();
    var result = await db.query("select * from users");
    print(result.toString());
  }

  Future<bool> exist(int value) async {
    List<dynamic> emailId = [1];
    var db = await getConnection();
    var result =
        await db.query("users", columns: ["id", "email"], where: "id = $value");
    print(result);
    // if(result == null || result == ''){
    //   return false;
    // }
    return true;
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
  print(_Connection().exist(1));
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Database demo"),
        ),
        drawer: Container(
          padding: EdgeInsets.all(20),
          color: Colors.cyan,
          child: const Text("help"),
        ),
        floatingActionButton: Container(
          child: GestureDetector(
            onTap: () {
              print("hai");
            },
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          color: Colors.cyan,
          child: const Text("help"),
        ),
      ),
    ),
  );
}
