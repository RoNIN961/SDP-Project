import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String username = '';

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
      "Username": username.text.trim(),
      "Password": password.text.trim(),
      "Email": email.text.trim(),
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    // obtain shared preferences

    if (jsonString == 'success') {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final logo = CustomLogo(
      onPressed: null,
      image: null,
    );
    final inputUsername = CustomTextField(
      onPressed: null,
      text: 'Username',
    );
    final inputEmail = CustomTextField(
      onPressed: null,
      text: 'email address',
    );
    final inputPassword = CustomHiddenTextField(
      onPressed: null,
      text: 'password',
    );
    final inputConfirmPassword = CustomHiddenTextField(
      onPressed: null,
      text: 'confirm password',
    );
    final buttonRegister = CustomButton1(
        onPressed: () {
          Navigator.pushNamed(context, '/');
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
            logo,
            inputUsername,
            inputEmail,
            inputPassword,
            inputConfirmPassword,
            buttonRegister, //test
          ],
        ),
      ),
    ));
  }
}
