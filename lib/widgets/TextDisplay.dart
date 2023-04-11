import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final String data;

  const TextDisplay(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('[http]'),
            // toolbarHeight: 70,
            // toolbarTextStyle: TextStyle(),
          ),
          body: Text("hai")),
    );
  }
}
