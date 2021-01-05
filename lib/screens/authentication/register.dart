import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  var url = "https://czechoslovakian-scr.000webhostapp.com/register.php";

  void addData() async {
    var response = await http.post(url, body: {
      'Username': username.text.trim(),
      'Password': password.text.trim(),
      'Email': email.text.trim(),
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    // obtain shared preferences

    if (jsonString == 'success') {
      myToast(jsonString);
      Navigator.pushNamed(context, '/');
    } else {
      myToast(jsonString);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputUsername =
        CustomTextField(text: 'Username', controller: username);
    final inputEmail = CustomTextField(
      text: 'email address',
      controller: email,
    );
    final inputPassword = CustomHiddenTextField(
      text: 'password',
      controller: password,
    );
    final buttonRegister = CustomButton1(
        onPressed: () {
          addData();
        },
        text: 'Create Account');
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            inputUsername,
            inputEmail,
            inputPassword,
            buttonRegister,
          ],
        ),
      ),
    ));
  }
}

myToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
