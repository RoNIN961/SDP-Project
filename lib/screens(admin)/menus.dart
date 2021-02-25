import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Menus {
  final String menu;
  final int total;
  final charts.Color barColor;

  Menus({@required this.menu, @required this.total, this.barColor});
}
