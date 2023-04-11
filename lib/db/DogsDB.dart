import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Dog.dart';

Future getConnection() async {
  String createCommand =
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT,age INTEGER)';
  // print(Dog(id: 1,name: "csca",age: 2).toMap());
  WidgetsFlutterBinding.ensureInitialized(); //avoid flutter upgrade errors
  // print(await getDatabasesPath());
  final dataBase = openDatabase(
    join(await getDatabasesPath(), 'dog_database.db'),
    // onCreate: (db, version) async {
    //   return await db.execute(createCommand);
    // },
    // version: 1,
  );
  return dataBase;
}

Future<List<Dog>> getData() async {
  final db = await getConnection();
  final List<Map<String, dynamic>> maps = await db.query('dogs');
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}

Future<void> insertDog(Dog dog) async {
  var db = await getConnection();
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

void main() async {
  insertDog(const Dog(age: 20, name: "surya", id: 3));
  // print("proceeding");
  var data = await getData();
  // String res ;

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Database demo"),
        ),
        body: Text(data.toString()),
      ),
    ),
  );
}
