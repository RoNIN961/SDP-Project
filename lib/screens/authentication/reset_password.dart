import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputEmail = CustomTextField(onPressed: null, text: 'email address');
    final buttonReset = CustomButton2(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        text: 'Reset Password');

    return SafeArea(
        child: Scaffold(
      body: Center(
          child: ListView(
        children: <Widget>[inputEmail, buttonReset],
      )),
    ));
  }
}
