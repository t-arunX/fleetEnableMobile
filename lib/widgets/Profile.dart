import 'package:flutter/material.dart';

import '../models/User_Profile.dart';

class Profile extends StatelessWidget {
  final UserProfile? user;

  const Profile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      // color: Colors.white,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(
            5.0,
            20.0,
          ),
          blurRadius: 20.0,
          spreadRadius: 5.0,
        ),
      ]),

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
                  user?.name ?? "not available",
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

class DisplayColors {
  static const Color textLabel = Colors.white24;
}

class DisplayProfile extends StatelessWidget {
  UserProfile userData;

  DisplayProfile(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "profile page",
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(18, 140, 126, 10),
        // 7 94 84
        // 18, 140, 126
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("user Profile"),
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, //coloring
            ),
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Column(
          children: [
            Image.network(
              userData.profileImage,
              width: double.maxFinite,
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
                        style: TextStyle(fontSize: 18, color: Colors.white54),
                      ),
                      Text(
                        userData.name,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Character: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.white54),
                      ),
                      Text(
                        userData.character,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Village: ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.white54),
                      ),
                      Text(
                        userData.village,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
