import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RaisedButton(
      child: Text('Logout'),
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
    ));
  }
}
