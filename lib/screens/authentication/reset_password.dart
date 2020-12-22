import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CustomTextField(
      onPressed: null,
      text: 'email address',
    )));
  }
}
