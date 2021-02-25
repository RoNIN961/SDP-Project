import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/loginBloc.dart';
import 'navbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String username = BlocProvider.of<LoginBloc>(context).name;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Nav()));
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/personicon.jpg'),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                username,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Super Admin",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
             
            ],
          ),
        ),
        );
  }
}
