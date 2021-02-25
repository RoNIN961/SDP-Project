import 'dart:convert';

import 'package:http/http.dart' as http;

import 'homerecipeModel.dart';

class HomeRecipeRepo {
  Future<List<HomeRecipeModel>> getData(String userid) async {
    final result = await http.get(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_all_recipe.php",
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<HomeRecipeModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonRecipe = jsonDecoded['data'];
    List<HomeRecipeModel> datalist = [];

    for (int i = 0; i < jsonRecipe.length; i++) {
      datalist.add(
        HomeRecipeModel.fromJson(jsonRecipe[i]),
      );
    }
    return datalist;
  }
}
