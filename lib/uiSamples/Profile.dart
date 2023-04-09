import 'package:flutter/material.dart';
import 'package:flutter_projects/models/User.dart';
import '../models/User_Profile.dart';

class Profile extends StatelessWidget {
  final UserProfile? user;

  const Profile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      // color: Colors.white,
      // decoration: const BoxDecoration(color: Colors.white,boxShadow:
      //   [BoxShadow(
      //   color: Colors.black,
      //   offset: Offset(
      //     10.0,
      //     15.0,
      //   ),
      //   blurRadius: 20.0,
      //   spreadRadius: 5.0,
      // ),]
      // ),
      child: InkWell(
        splashColor: Colors.grey.shade300,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => DisplayProfile(user!))),
        child: Container(
          decoration: ShapeDecoration.fromBoxDecoration(
            BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade400),
            ),
          ),
          margin: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 2),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user!.profileImage),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0.5),
                padding: const EdgeInsets.all(20),
                child: Text(
                  user!.name,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromRGBO(35, 35, 35, 100)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayProfile extends StatelessWidget {
  UserProfile userData;

  DisplayProfile(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "profile page",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(18, 140, 126,100),
          title: const Text("user Profile"),
          leading: Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 140, 126, 100), //coloring
              ),
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
        body: Column(
          children: [
            Image.network(
              userData.profileImage,
              width: 500,
              // height: 250,
              // fit: BoxFit.fitHeight,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Name: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      Text(
                        userData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Character: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      Text(
                        userData.character,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Village: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      Text(
                        userData.village,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
