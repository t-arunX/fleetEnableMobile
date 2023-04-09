import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/models/User_Profile.dart';
import 'package:flutter_projects/uiSamples/ex1.dart';

import 'uiSamples/Profile.dart';

void main() {
  // print("hello");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List users = [
    UserProfile(
        "naruto Uzumaki",
        "https://occ-0-1556-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABYxJFBDckfZw1YUEIPwyuIg43Kw_HUBLvnCcgdOlvvf5Nc90SF3HSAi5L8uLyBqjziKBY-kGD2wu2JAqVsdHVR0frb6qG26I_U5v.jpg?r=77f",
        "knuckle head",
        "Hidden Leaf village"),
    UserProfile(
        "Sasuke Uchiha ",
        "https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest/scale-to-width-down/300?cb=20170716092103",
        "Depressed kid",
        "Hidden Leaf village"),
    UserProfile(
        "Itachi Uchiha",
        "https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20220214112531",
        "prodigy",
        "Hidden Leaf village"),
    UserProfile(
        "Kakashi Hatake",
        "https://static.wikia.nocookie.net/naruto/images/2/27/Kakashi_Hatake.png/revision/latest/scale-to-width-down/300?cb=20170628120149",
        "hokage",
        "Hidden Leaf village"),
    UserProfile(
        "Obito Uchiha",
        "https://static.wikia.nocookie.net/naruto/images/4/4a/Obito_Uchiha.png/revision/latest/scale-to-width-down/300?cb=20220223045744",
        "Akatsuki member",
        "Hidden Leaf village"),

    UserProfile(
        "Dengaku",
        "https://static.wikia.nocookie.net/naruto/images/f/f6/Dengaku.png/revision/latest/scale-to-width-down/300?cb=20150117112616",
        "oden owner",
        "Hidden Leaf village"),
    UserProfile(
        "Boruto Uzumaki",
        "https://static.wikia.nocookie.net/naruto/images/d/de/Boruto_Infobox.png/revision/latest/scale-to-width-down/300?cb=20220130144217",
        "Akatsuki member",
        "Hidden Leaf village"),
    UserProfile(
        "Hinata Uzumaki",
        "https://static.wikia.nocookie.net/naruto/images/9/97/Hinata.png/revision/latest/scale-to-width-down/300?cb=20141010104729",
        "Team 8",
        "Hidden Leaf village"),

    UserProfile(
        "Himawari Uzumaki",
        "https://static.wikia.nocookie.net/naruto/images/2/26/Himawari.png/revision/latest/scale-to-width-down/300?cb=20171115100745",
        "Team 8",
        "Hidden Leaf village"),
    UserProfile(
        "Hinata Uzumaki",
        "https://static.wikia.nocookie.net/naruto/images/9/97/Hinata.png/revision/latest/scale-to-width-down/300?cb=20141010104729",
        "Team 8",
        "Hidden Leaf village"),
  ];

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
    return
        // DisplayProfile(users.first);
        MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Profiles"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...?widgetList(),
            ],
          ),
        ),
      ),
    );
  }
}
