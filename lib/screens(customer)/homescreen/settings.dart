import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[],
        ),
        body: ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
          ListTile(
            title: Text('Privacy Settings'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ]));
  }
}
