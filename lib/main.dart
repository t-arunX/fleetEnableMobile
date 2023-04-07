import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Data/User.dart' as users;
import 'uiSamples/Profile.dart';

void main() {
  // print("hello");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  String narutoUrl =
      "https://occ.a.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYxJFBDckfZw1YUEIPwyuIg43Kw_HUBLvnCcgdOlvvf5Nc90SF3HSAi5L8uLyBqjziKBY-kGD2wu2JAqVsdHVR0frb6qG26I_U5v.jpg?r=77f";

  String sasukeUrl = "https://images3.alphacoders.com/907/907283.jpg";

  List<Widget>? widgetList(int count) {
    List<Widget>? list = [];
    for (int i = 0; i < count; i++) {
      list.add(Profile("naruto Uzumaki", narutoUrl));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: ColorSwatch(Colors.red),
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text("Profiles"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...?widgetList(21),
            ],
          ),
        ),
      ),
    );
  }
}


