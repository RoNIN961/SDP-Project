import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
