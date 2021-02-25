import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/admin/adminBloc.dart';
import '../bloc/login/loginBloc.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String username = BlocProvider.of<LoginBloc>(context).name;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(username,
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepOrange))
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 3, top: 18),
            child: Row(
              children: <Widget>[
                Text('Operations',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ))
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Container(
                    height: 300,
                    width: 360,
                    child: Card(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/statistics.jpg'),
                            height: 220,
                          ),
                          OutlineButton(
                            child: Text("Statistics"),
                            onPressed: () {
                              BlocProvider.of<AdminBloc>(context).add(
                                FetchAdminData(null),
                              );
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Data()));
                            },
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Container(
                    height: 300,
                    width: 360,
                    child: Card(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/addrestaurant.jpg'),
                            height: 220,
                          ),
                          OutlineButton(
                            child: Text("New Restaurant"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/add_restaurant');
                            },
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
