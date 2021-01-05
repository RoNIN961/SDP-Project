import 'package:flutter/material.dart';
import 'package:sdp_project/screens/authentication/register.dart';
import '../../theme/custom.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'https://czechoslovakian-scr.000webhostapp.com/login.php';

    // Store all data with Param Name.
    var data = {'Email': email, 'Password': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.pushNamed(context, '/Home');
    } else {
      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
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
  }

  @override
  Widget build(BuildContext context) {
    final logo = CustomLogo(onPressed: null, image: null);
    final inputEmail = CustomTextField(
      text: 'email address',
      controller: emailController,
    );
    final inputPassword = CustomHiddenTextField(
      text: 'password',
      controller: passwordController,
    );
    final buttonRegister = CustomButton2(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        text: 'Not a member? Register here',
        color: Colors.red);
    final buttonLogin = CustomButton1(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      text: 'login',
    );
    final buttonForgotPassword = CustomButton2(
      onPressed: null,
      text: 'Forgot Password',
      color: Colors.grey,
    );
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            inputEmail,
            inputPassword,
            buttonRegister,
            buttonLogin,
            buttonForgotPassword
          ],
        ),
      ),
    ));
  }
}
