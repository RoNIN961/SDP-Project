import 'dart:convert';

import 'package:http/http.dart' as http;

import 'restotalModel.dart';

class ResTotalRepo {
  Future<List<ResTotalModel>> getData(String resid) async {
    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/restaurant_total_report.php",
        body: {'resid': resid});

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<ResTotalModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonMenu = jsonDecoded['data'];
    List<ResTotalModel> datalist = [];

    for (int i = 0; i < jsonMenu.length; i++) {
      datalist.add(
        ResTotalModel.fromJson(jsonMenu[i]),
      );
    }
    print(jsonMenu);
    return datalist;
  }
}
