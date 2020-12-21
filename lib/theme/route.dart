import '../screens/login.dart';
import '../screens/register.dart';
import '../screens/check_points.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/edit_profile.dart';
import '../screens/homecontent.dart';
import '../screens/recipe_detail.dart';
import '../screens/search.dart';
import '../screens/settings.dart';
import '../screens/user_recipes.dart';
import '../screens/restaurant.dart';
import '../screens/restaurant_detail.dart';

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
