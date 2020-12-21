import 'login.dart';
import 'register.dart';
import 'check_points.dart';
import 'home.dart';
import 'profile.dart';
import 'edit_profile.dart';
import 'homecontent.dart';
import 'recipe_detail.dart';
import 'search.dart';
import 'settings.dart';
import 'user_recipes.dart';
import 'restaurant.dart';
import 'restaurant_detail.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/check_points': (context) => CheckPointsPage(),
    '/home': (context) => Home(),
    '/profile': (content) => ProfilePage(),
    '/edit_profile': (content) => EditProfilePage(),
    '/homecontent': (content) => HomeContentPage(),
    '/recipe_detail': (content) => RecipeScreen(),
    '/search': (content) => SearchPage(),
    '/settings': (content) => SettingsPage(),
    '/user_recipes': (content) => UserRecipePage(),
    '/restaurant': (content) => RestaurantPage(),
    '/restaurant_detail': (content) => RestaurantContent()
  };
}
