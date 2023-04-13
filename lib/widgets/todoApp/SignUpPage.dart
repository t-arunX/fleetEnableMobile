import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/todoApp/LoginPage.dart';

import './models/User.dart';

class SignUpPageState extends StatefulWidget {
  const SignUpPageState({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
}

class SignUpPage extends State<SignUpPageState> {
  final _formKey = GlobalKey<FormState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(useMaterial3: mounted),
      // theme: ThemeData.dark(useMaterial3: mounted),
      theme: ThemeData.fallback(useMaterial3: mounted),
      home: Scaffold(
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  // print("password validator");
                                  validator: (value) {
                                    // String? validate = "true";
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
                                    helperStyle:
                                        TextStyle(color: Colors.blueAccent),
                                    label: Text(
                                      "Password",
                                    ),
                                  ),
                                  validator: (value) {
                                    // String? validate = "true";
                                    print("password validator");
                                    return (value == null || value.isEmpty)
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
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        print(user);
                                        //handle submission
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPageState()),
                                        );
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
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        // alignment: Alignment.centerLeft,
                        // color: Colors.white12,
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
                              onPressed: () {},
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
      ),
    );
  }
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const SignUpPageState());
// }
