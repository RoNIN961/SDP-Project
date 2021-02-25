import 'dart:convert';

import 'package:http/http.dart' as http;

import 'adminModel.dart';

class AdminRepo {
  Future<List<AdminModel>> getData(String userid) async {
    final result = await http.get(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_total_records.php",
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<AdminModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonMenu = jsonDecoded['data'];
    List<AdminModel> datalist = [];

    for (int i = 0; i < jsonMenu.length; i++) {
      datalist.add(
        AdminModel.fromJson(jsonMenu[i]),
      );
    }
    return datalist;
  }
}
