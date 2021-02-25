import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Recipes {
  final String recipe;
  final int total;
  final charts.Color barColor;

  Recipes({@required this.recipe, @required this.total, this.barColor});
}
