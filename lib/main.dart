import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/HomePage.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/SplashScreen.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/app/FirstPage.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/auth/LoginPage.dart';
import 'package:flutter_projects/widgets/todoApp/helpers/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Log {
  logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setBool(
          'login', false); // fails for the first time of initialization
    } on Exception catch (_, ex) {
      print("failed");
    }
    navigate(context);
  }

  navigate(context) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  Future<int?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  SharedPreferences prefs =
      await SharedPreferences.getInstance(); // instantiation of shared prefs
  bool? exists = false;
  var id = await Log().getUser();
  // print(id);
  try {
    exists =
        prefs.getBool('login'); // fails for the first time of initialization
  } on Exception catch (_, ex) {
    await prefs.setBool('login', false);
    // exists = false;
  }
  // check for previous login status
  if (exists == null || exists == false) {
    //redirect to login page
    runApp(const SplashScreen());
    Future.delayed(const Duration(seconds: 2), () {
      runApp(const HomePage(LoginPage()));
    });
  } else {
    // redirect to Todoapp
    runApp(const SplashScreen());
    Future.delayed(const Duration(seconds: 2), () async {
      List lst = await Connection().getTodoList(id!);
      runApp(HomePage(FirstPage(id!, lst)));
    });
  }
}
