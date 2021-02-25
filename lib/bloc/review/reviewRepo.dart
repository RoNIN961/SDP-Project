import 'dart:convert';

import 'package:http/http.dart' as http;

import 'reviewModel.dart';

class ReviewRepo {
  Future<List<ReviewModel>> getData(String menuid) async {
    final result = await http.post(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_review_based_on_menu.php",
      body: {'Menu_ID': menuid},
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<ReviewModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonMenu = jsonDecoded['data'];
    List<ReviewModel> datalist = [];

    for (int i = 0; i < jsonMenu.length; i++) {
      datalist.add(
        ReviewModel.fromJson(jsonMenu[i]),
      );
    }
    print(datalist);
    return datalist;
  }
}
