import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.list_alt_rounded,
                size: 80,
                color: Colors.deepPurple,
              ),
              SizedBox(
                height: 280,
              ),
              CircularProgressIndicator(
                strokeWidth: 2,
                // color: Colors.white60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
