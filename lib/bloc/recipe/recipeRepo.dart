import 'package:http/http.dart' as http;
import 'package:sdp_project/bloc/recipe/recipeModel.dart';
import 'dart:convert';
import 'recipeModel.dart';

class RecipeRepo {
  Future<List<RecipeModel>> getData(String title, String author) async {
    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/recipe_details.php",
        body: {
          'Recipe_Title': title,
          'Username': author,
        });

    if (result.statusCode != 200) throw Exception();

    print(result.body);
    return parsedJson(result.body);
  }

  List<RecipeModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    List datalist = [];

    for (int i = 0; i < jsonDecoded.length; i++) {
      datalist.add(RecipeModel.fromJson(jsonDecoded[i]));
    }
    return datalist;
  }
}
