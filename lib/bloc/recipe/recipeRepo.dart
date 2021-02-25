import 'dart:convert';

import 'package:http/http.dart' as http;

import 'recipeModel.dart';

class RecipeRepo {
  Future<List<RecipeModel>> getData(String userid) async {
    final result = await http.post(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_recipe_based_on_user.php",
      body: {'User_ID': userid},
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<RecipeModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonRecipe = jsonDecoded['data'];
    List<RecipeModel> datalist = [];

    for (int i = 0; i < jsonRecipe.length; i++) {
      datalist.add(
        RecipeModel.fromJson(jsonRecipe[i]),
      );
    }
    return datalist;
  }
}
