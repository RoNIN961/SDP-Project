import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'menus.dart';

class MenusChart extends StatelessWidget {
  final List<Menus> data;

  MenusChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Menus, String>> series = [
      charts.Series(
          id: "Menus",
          data: data,
          domainFn: (Menus series, _) => series.menu,
          measureFn: (Menus series, _) => series.total,
          colorFn: (Menus series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
          child: Column(
        children: <Widget>[
          Text(
            "Current Total Menus",
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
