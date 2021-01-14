import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/theme/route.dart';
import 'screens/authentication/login/loginBloc.dart';
import 'screens/authentication/login/loginRepo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return
        // BlocProvider(
        //   create: (context) => LoginBloc(LoginRepo()),
        //   child:
        MaterialApp(
      title: 'Flutter Simple Login Page',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: getroute(),
      // ),
    );
  }
}
