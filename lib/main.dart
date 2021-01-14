import 'package:flutter/material.dart';
import 'package:sdp_project/theme/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Flutter Simple Login Page',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: getroute(),
    );
  }
}
