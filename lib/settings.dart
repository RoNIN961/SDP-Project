import 'package:flutter/material.dart';
import 'login.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FloatingActionButton(
      child:Text('Logout'),
      onPressed: (){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
      },
    )
    )
  )
  }
}