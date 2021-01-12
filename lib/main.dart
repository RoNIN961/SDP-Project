import 'package:flutter/material.dart';
import 'route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Login Page',
      initialRoute: '/rest_home',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: getroute(),
    );
  }
}
