import 'package:flutter/material.dart';


class RestaurantHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Card(),
            Row(children: <Widget>[Card(), Card()])
          ],
        ));
  }
}
