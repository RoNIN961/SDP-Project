import 'package:http/http.dart' as http;
import 'dart:convert';
import 'restaurantModel.dart';

class RestaurantRepo {
  Future<RestaurantModel> getData(
      String resName, String resEmail, String resAddress) async {
    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/fetchRestaurant.php",
        body: {
          'Email': resEmail,
          'Restaurant_Name': resEmail,
          'Address': resAddress
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
