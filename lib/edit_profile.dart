import 'package:flutter/material.dart';
import 'home.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profilePicture = Container(
        alignment: Alignment(0.0, 2.5),
        child: CircleAvatar(
          backgroundImage: NetworkImage("Add you profile DP image URL here "),
          radius: 60.0,
        ),
      );
    final changeProfilePic = FlatButton(
          onPressed: () {},
          child: Text(
            'Change Your Profile Picture',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blueAccent,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ));
      final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
    final saveChanges = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Save Changes',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
    );
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
              profilePic,
              changeProfilePic,
              inputEmail
    ])));
  }
}
