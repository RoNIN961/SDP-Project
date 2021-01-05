import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sdp_project/theme/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Login Page',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: getroute(),
    );
  }

  Future getData() async {
    var url = 'https://czechoslovakian-scr.000webhostapp.com/get.php';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data.toString());
  }

  @override
  void initState() {
    getData();
  }
}
