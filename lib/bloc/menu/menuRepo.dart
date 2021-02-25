import 'dart:convert';

import 'package:http/http.dart' as http;

import 'menuModel.dart';

class MenuRepo {
  Future<List<MenuModel>> getData(String restaurantid) async {
    final result = await http.post(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_menu_based_on_restaurant.php",
      body: {'Restaurant_ID': restaurantid},
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<MenuModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonMenu = jsonDecoded['data'];
    List<MenuModel> datalist = [];

    for (int i = 0; i < jsonMenu.length; i++) {
      datalist.add(
        MenuModel.fromJson(jsonMenu[i]),
      );
    }
    return datalist;
  }
}
