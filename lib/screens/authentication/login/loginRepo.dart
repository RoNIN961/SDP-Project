import 'package:http/http.dart' as http;
import 'dart:convert';
import 'loginModel.dart';

class LoginRepo {
  Future<LoginModel> getData(String email, String password) async {
    email = email;
    password = password;

    final result = await http.post(
        "https://czechoslovakian-scr.000webhostapp.com/login.php",
        body: {'Email': email, 'Password': password});
    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  LoginModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    return LoginModel.fromJson(jsonDecoded);
  }
}
