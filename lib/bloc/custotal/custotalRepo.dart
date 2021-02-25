import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sdp_project/bloc/custotal/custotalModel.dart';

class CusTotalRepo {
  Future<List<CusTotalModel>> getData(String userid) async {
    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/customer_total_report.php",
        body: {'userid': userid});

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<CusTotalModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonMenu = jsonDecoded['data'];
    List<CusTotalModel> datalist = [];

    for (int i = 0; i < jsonMenu.length; i++) {
      datalist.add(
        CusTotalModel.fromJson(jsonMenu[i]),
      );
    }
    print(jsonMenu);
    return datalist;
  }
}
