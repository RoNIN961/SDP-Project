import 'package:flutter/material.dart';
import 'package:sdp_project/home.dart';

class RestaurantContent extends StatefulWidget {
  @override
  _RestaurantContent createState() => _RestaurantContent();
}

class _RestaurantContent extends State<RestaurantContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        FlatButton(
          onPressed: () {},
          child: Text("Check Points"),
        )
      ]),
      body: Column(
        children: <Widget>[
          Image.network(''),
          Text('Restaurant Name', style: TextStyle(fontSize: 40)),
          Text('Opening hours', style: TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
