import 'package:http/http.dart' as http;
import 'dart:convert';
import 'loginModel.dart';

class LoginRepo {
  Future<LoginModel> getData(String email) async {
    final result = await http.Client()
        .get("https://czechoslovakian-scr.000webhostapp.com/login.php");

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  LoginModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonData = jsonDecoded['User'];

    return LoginModel.fromJson(jsonData);
  }
}
