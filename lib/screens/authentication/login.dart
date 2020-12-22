import 'package:flutter/material.dart';
import '../../theme/custom.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = CustomLogo(
      onPressed: null,
      image: Image.asset('login_logo.png'),
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
