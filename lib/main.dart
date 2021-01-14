import 'package:admin_ui/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.deepOrange),
      title: 'FoodAmore',
      home: LoginPage(),
    );
  }
}
