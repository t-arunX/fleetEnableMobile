import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/app/FirstPage.dart';
import 'package:flutter_projects/widgets/todoApp/helpers/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/User.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User();

  navigateToScreen(BuildContext context) async {
    try {
      var checkUserExists = await Connection().exists(user);
      var authPass = await Connection().authPass(user);
      var id = await Connection().find(user.email);

      if (checkUserExists) {
        // auth check
        if (authPass) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('userId', id[0]['id']);
          prefs.setBool('login', true);
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FirstPage(id[0]['id'], []),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incorrect password")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("No user Exists")));
      }
    } catch (_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Incorrect credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100, bottom: 170),
                  child: const Icon(
                    Icons.list_alt_rounded,
                    color: Colors.deepPurple,
                    size: 40,
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'enter your email',
                              labelText: 'e-mail',
                              // errorText: emailErrorMessage,
                            ),
                            validator: (value) {
                              return (value == null || value.isEmpty)
                                  ? 'Enter valid email'
                                  : null;
                            },
                            onChanged: (value) => user.email = value,
                            onSaved: (value) => user.email = value,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "enter your password",
                              helperText: 'forget password',
                              helperStyle: TextStyle(color: Colors.blueAccent),
                              label: Text(
                                "Password",
                              ),
                            ),
                            validator: (value) {
                              return (value == null || value.isEmpty)
                                  ? 'Password must contain atleast 4 characters'
                                  : null;
                            },
                            onChanged: (value) => user.password = value,
                            onSaved: (value) => user.password = value,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              child: const Text("Login"),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  navigateToScreen(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Don't hava an account yet?",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const SignUpPageState(),
                              ),
                            );
                          },
                          child: const Text("Create new account"),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: LoginPage()));
}
