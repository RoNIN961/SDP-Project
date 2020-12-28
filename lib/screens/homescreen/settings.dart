import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
        title: Text('logout'),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      )
    ]);
  }
}
