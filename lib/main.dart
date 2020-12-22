import 'package:flutter/material.dart';
import 'package:sdp_project/theme/custom.dart';
import 'package:sdp_project/theme/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Login Page',
      theme: gettheme(),
      initialRoute: '/',
      routes: getroute(),
    );
  }
}
