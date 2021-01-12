import 'package:flutter/material.dart';
import 'package:admin_ui/navbar.dart';
void main(){
  runApp(Admin());
}

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.deepOrange),
      title: 'bottom nav bar',
      home: Nav(),
    );
  }
}
