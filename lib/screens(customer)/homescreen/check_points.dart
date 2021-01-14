import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
        body: Center(
            child: new CircularPercentIndicator(
                radius: 200.0,
                percent: 0.4,
                lineWidth: 20.0,
                animation: true,
                center: new Text(
                  'Current Points',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                header: new Text(
                  'Points until next discount voucher',
                  style: new TextStyle(fontSize: 30.0),
                ))));
  }
}
