import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/Widgets/auth/LoginPage.dart';
import 'package:flutter_projects/widgets/todoApp/helpers/Connection.dart';

import '../../models/User.dart';

class SignUpPageState extends StatefulWidget {
  const SignUpPageState({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
}

navigateToScreen(BuildContext context) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const LoginPage(),
    ),
  );
}

class SignUpPage extends State<SignUpPageState> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  int? tokenId;

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
                              hintText: "enter your email",
                              labelText: 'e-mail',
                            ),
                            validator: (value) {
                              print("email validator");
                              return (value == null || value.isEmpty)
                                  ? 'Enter valid email'
                                  : null;
                            },
                            onChanged: (value) {
                              user.email = value;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "enter your password",
                              // helperText: 'forget password',
                              helperStyle: TextStyle(color: Colors.blueAccent),
                              label: Text(
                                "Password",
                              ),
                            ),
                            validator: (value) {
                              return (value == null ||
                                      value.isEmpty ||
                                      value.length < 4)
                                  ? 'Password must contain at least 4 characters'
                                  : null;
                            },
                            onChanged: (value) {
                              user.password = value;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              child: const Text("Signup"),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  //handle submission
                                  try {
                                    await Connection()
                                        .createInsert("users", user);
                                    navigateToScreen(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("please login")));
                                  } catch (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "user may already exist")));
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateToScreen(context);
                            },
                            child: const Text("login"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
