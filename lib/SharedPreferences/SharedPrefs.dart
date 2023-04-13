import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void sharedSpaceManager() async {
    try {
      // WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setPrefix("log");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? data = prefs.getStringList('login');
      String? val = "login status is successful";
      data?.add(val);
      await prefs.setStringList("login", data!);
      print(prefs.getStringList("login"));
    } catch (ex) {
      print(ex);
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs sp = SharedPrefs();
  sp.sharedSpaceManager();
}
