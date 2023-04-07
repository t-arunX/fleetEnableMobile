import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String name;
  String imageUrl;

  Profile(this.name, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 1),
      decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 80,
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          Container(
            // color: Colors.blue,
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "name",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
