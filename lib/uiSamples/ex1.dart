import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // print("hello");
  runApp(StateManager());
}

class StateManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

class MyApp extends State<StateManager> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("appbar"),
        ),
        body: Container(
          color: Colors.amberAccent,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // alignment: AlignmentDirectional.bottomCenter,
          width: double.infinity,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    counter++;
                  }),
                }, //pressed event
                child: Text(
                  "$counter",
                  style: const TextStyle(color: Colors.white24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  String? data;

  SecondPage({String? data, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: const Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  shadowColor: MaterialStateProperty.all(Colors.black)),
              child: const Text("page open 2"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                ); //push
              }, //onPress
            ),
          ),
        ),
      ),
    );
  }
}
