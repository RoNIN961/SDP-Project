import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        alignment: Alignment(0.0, 2.5),
        child: CircleAvatar(
          backgroundImage: NetworkImage("Add you profile DP image URL here "),
          radius: 60.0,
        ),
      ),
      FlatButton(
          onPressed: () {},
          child: Text(
            'Change Your Profile Picture',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blueAccent,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ))
    ])));
  }
}
