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
        body: Container(
          height: 300,
          width: 300,
          margin: EdgeInsets.all(100.0),
          decoration:
              BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          child: Text('Check your points here'),
        ));
  }
}
