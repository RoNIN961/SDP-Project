import 'package:flutter/material.dart';


class RestaurantHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Card(),
            Row(children: <Widget>[Card(), Card()])
          ],
        ));
  }
}
