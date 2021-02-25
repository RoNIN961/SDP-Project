import 'dart:convert';

import 'package:http/http.dart' as http;

import 'homerestaurantModel.dart';

class HomeRestaurantRepo {
  Future<List<HomeRestaurantModel>> getData(String resid) async {
    final result = await http.get(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_all_restaurant.php",
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<HomeRestaurantModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonRecipe = jsonDecoded['data'];
    List<HomeRestaurantModel> datalist = [];

    for (int i = 0; i < jsonRecipe.length; i++) {
      datalist.add(
        HomeRestaurantModel.fromJson(jsonRecipe[i]),
      );
    }
    return datalist;
  }
}
