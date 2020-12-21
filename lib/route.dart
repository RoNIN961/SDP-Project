import 'login.dart';
import 'register.dart';
import 'check_points.dart';
import 'home.dart';
import 'profile.dart';
import 'edit_profile.dart';
import 'homecontent.dart';
import 'recipe_detail.dart';
import 'serach.dart';
import 'settings.dart';
import 'user_recipes.dart';
import 'restaurant.dart';
import 'restaurant_detail.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/second': (context) => RegisterPage(),
  };
}
