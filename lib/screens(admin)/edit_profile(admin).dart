import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditUserProfilePage extends StatefulWidget {
  final userListDisplay;
  EditUserProfilePage(this.userListDisplay);

  @override
  _EditUserProfilePageState createState() =>
      _EditUserProfilePageState(userListDisplay);
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  final userListDisplay;
  _EditUserProfilePageState(this.userListDisplay);

  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool showPassword = true;

  Future editData() async {
    try {
      String username = usernamecontroller.text;
      String email = emailcontroller.text;
      String password = passwordcontroller.text;
      String id = userListDisplay.id;

      var url = 'https://czechoslovakian-scr.000webhostapp.com/edit_user.php';

      var data = {
        'id': id,
        'username': username,
        'password': password,
        'email': email,
      };

      var response = await http.post(url, body: data);

      var message = response.body;

      if (message == 'Successfully Updated') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Center(
                child: Text(message),
              ),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Center(
                child: Text(message),
              ),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: <Widget>[
                Center(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(height: 5),
                buildUsernameTextField("Username", userListDisplay.username),
                buildEmailTextField("Email", userListDisplay.email),
                buildPasswordTextField("Password", userListDisplay.password),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ButtonTheme(
                    height: 56,
                    child: RaisedButton(
                      child: Text('Update',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        editData();
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildUsernameTextField(String labeltext, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: usernamecontroller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labeltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(String labeltext, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: passwordcontroller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labeltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildEmailTextField(String labeltext, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: emailcontroller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labeltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
