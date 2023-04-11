import 'package:flutter/material.dart';
import 'package:flutter_projects/Data/ProfileData.dart';
import 'package:flutter_projects/http/Http.dart';

import './widgets/Profile.dart';

void main() {
  runApp(MyApp());
}

Future getData() async {
  // doesn't work directly work with widgets need to create a class for that :: refer album class form flutter.dev
  var http = Http();
  var data = await http.getData();
  return data;
}

class MyApp extends StatelessWidget {
  List users = ProfileData.data;

  List<Widget>? widgetList() {
    List<Widget>? list = [];
    var iter = users.iterator;
    while (iter.moveNext()) {
      list.add(Profile(iter.current));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Profiles"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ...?widgetList(),
              // DisplayProfile(users.last)
              Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
