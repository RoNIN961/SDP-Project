import 'package:http/http.dart' as http;
import 'dart:convert';
import 'restaurantModel.dart';

class RestaurantRepo {
  Future<List<RestaurantModel>> getData(String title, String author) async {
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

  List<RestaurantModel> parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    List datalist = [];

    for (int i = 0; i < jsonDecoded.length; i++) {
      datalist.add(RestaurantModel.fromJson(jsonDecoded[i]));
    }
    return datalist;
  }
}
