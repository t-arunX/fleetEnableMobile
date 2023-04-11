import 'package:flutter/material.dart';
import 'package:flutter_projects/Data/ProfileData.dart';
import 'package:flutter_projects/widgets/TextDisplay.dart';

import './widgets/Profile.dart';
import 'http/HttpCall.dart';

void main() async {
  String result = (await new HttpCall.getData()) as String;
  runApp(MyApp());
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
    return TextDisplay();
    //   MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.teal,
    //       title: const Text("Profiles"),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           ...?widgetList(),
    //           // DisplayProfile(users.last)
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
