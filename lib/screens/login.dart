import 'package:flutter/material.dart';
import '../theme/custom.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/login_logo.png'),
          )),
    );
    final inputEmail = CustomTextField(
      onPressed: () {},
      text: 'email address',
    );
    final inputPassword = CustomHiddenTextField(
      onPressed: () {},
      text: 'password',
    );
    final buttonRegister = CustomButton2(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        text: 'Not a member? Register here');
    final buttonLogin = CustomButton1(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      text: 'login',
    );
    final buttonForgotPassword =
        CustomButton2(onPressed: null, text: 'Forgot Password');
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
