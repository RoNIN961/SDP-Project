import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'users.dart';

class UsersChart extends StatelessWidget {
  final List<Users> data;

  UsersChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Users, String>> series = [
      charts.Series(
          id: "Users",
          data: data,
          domainFn: (Users series, _) => series.user,
          measureFn: (Users series, _) => series.total,
          colorFn: (Users series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
          child: Column(
        children: <Widget>[
          Text(
            "Current Total Users",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Expanded(
            child: charts.BarChart(series, animate: true),
          ),
        ],
      )),
    );
  }
}
