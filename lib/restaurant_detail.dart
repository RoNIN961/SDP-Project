import 'package:flutter/material.dart';

class RestaurantContent extends StatefulWidget {
  @override
  _RestaurantContent createState() => _RestaurantContent();
}

class _RestaurantContent extends State<RestaurantContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[
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
