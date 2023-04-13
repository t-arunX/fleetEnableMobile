import 'package:flutter/material.dart';

import 'SignUpPage.dart';

class LoginPageState extends StatefulWidget {
  const LoginPageState({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<LoginPageState> {
  final _formKey = GlobalKey<FormState>();

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
                                labelText: 'e-mail *'),
                            // print("password validator");
                            validator: (value) {
                              // String? validate = "true";
                              print("email validator");
                              return (value == null || value.isEmpty)
                                  ? 'Enter valid email'
                                  : null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "enter your password",
                              helperText: 'forget password',
                              helperStyle: TextStyle(color: Colors.blueAccent),
                              label: Text(
                                "Password *",
                              ),
                            ),
                            validator: (value) {
                              // String? validate = "true";
                              print("password validator");
                              return (value == null || value.isEmpty)
                                  ? 'Password must contain atleast 4 characters'
                                  : null;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              child: const Text("Login"),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const SignUpPageState(),
                                    ),
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
                              "Don't hava an account yet?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            TextButton(
                              onPressed: () {},
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
  runApp(const LoginPageState());
}
