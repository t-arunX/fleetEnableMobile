import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget page;

  const HomePage(this.page, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(useMaterial3: mounted),
      home: widget.page, //todoapp
    );
  }
}

