import 'dart:convert';

import 'package:http/http.dart' as http;

import 'restaurantModel.dart';

class RestaurantRepo {
  Future<RestaurantModel> getData(String email) async {
    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/fetch_restaurant.php",
        body: {
          'Email': email,
        });

    if (result.statusCode != 200) throw Exception();

    print(result.body);
    return parsedJson(result.body);
  }

  RestaurantModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    return RestaurantModel.fromJson(jsonDecoded);
  }
}
