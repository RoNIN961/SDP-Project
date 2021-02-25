import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Users {
  final String user;
  final int total;
  final charts.Color barColor;

  Users({@required this.user, @required this.total, this.barColor});
}
