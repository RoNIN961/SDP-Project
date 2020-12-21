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
    final inputEmail = CustomTextField(onPressed: () {});
    final inputPassword = CustomHiddenTextField(onPressed: () {});
    final buttonRegister = FlatButton(
        child: Text(
          'Not a member? Register here',
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        });
    final buttonLogin = CustomButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
    final buttonForgotPassword = FlatButton(
        child: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        onPressed: null);
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
