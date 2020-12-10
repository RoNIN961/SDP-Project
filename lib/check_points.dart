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
            height: 400,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              )),
          Positioned(bottom: 40, child: Text('Your Points Here'))
        ]));
  }
}
