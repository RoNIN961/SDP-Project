import 'package:flutter/material.dart';
import 'home.dart';

class CheckPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: Stack(children: <Widget>[
          Container(
            height: 500,
          ),
          Positioned(
              right: 50,
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(100.0),
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              )),
          Positioned(bottom: 40, right: 20, child: Text('Your Points Here'))
        ]));
  }
}
