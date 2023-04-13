import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(useMaterial3: mounted),
      home: const LoginPageState(),
    );
  }
}

void main() {
  runApp(const HomePage());
}
