import 'package:flutter/material.dart';

import '../theme/custom.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputEmail = CustomTextField(text: 'email address');
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
