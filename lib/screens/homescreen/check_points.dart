import 'package:flutter/material.dart';

class CheckPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        body: Stack(children: <Widget>[
          Positioned(
              right: 50,
              child: Container(
                height: 300,
                width: 300,
                margin: EdgeInsets.all(100.0),
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              )),
          Positioned(bottom: 20, right: 50, child: Text('Your Points Here'))
        ]));
  }
}