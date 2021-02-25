import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'recipes.dart';

class RecipesChart extends StatelessWidget {
  final List<Recipes> data;

  RecipesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Recipes, String>> series = [
      charts.Series(
          id: "Recipes",
          data: data,
          domainFn: (Recipes series, _) => series.recipe,
          measureFn: (Recipes series, _) => series.total,
          colorFn: (Recipes series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
          child: Column(
        children: <Widget>[
          Text(
            "Current Total Recipes",
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
