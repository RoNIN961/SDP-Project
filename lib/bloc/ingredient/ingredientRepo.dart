import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ingredientModel.dart';

class IngredientRepo {
  Future<List<IngredientModel>> getData(String recipeid) async {
    final result = await http.post(
      "https://czechoslovakian-scr.000webhostapp.com/fetch_ingredient_based_on_recipe.php",
      body: {'Recipe_ID': recipeid},
    );

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  List<IngredientModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonIngredient = jsonDecoded['data'];
    List<IngredientModel> datalist = [];

    for (int i = 0; i < jsonIngredient.length; i++) {
      datalist.add(
        IngredientModel.fromJson(jsonIngredient[i]),
      );
    }
    return datalist;
  }
}
