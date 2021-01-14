import '../screens/authentication/login/login.dart';
import '../screens/authentication/register.dart';
import '../screens/homescreen/check_points.dart';
import '../screens/homescreen/home.dart';
import '../screens/profile/profile.dart';
import '../screens/profile/edit_profile.dart';
import '../screens/homescreen/homecontent.dart';
import '../screens/recipe/recipe_detail.dart';
import '../screens/recipe/search.dart';
import '../screens/homescreen/settings.dart';
import '../screens/recipe/user_recipes.dart';
import '../screens/restaurant/restaurant.dart';
import '../screens/restaurant/restaurant_detail.dart';
import '../screens/recipe/recipe.dart';
import '../screens/recipe/upload_recipe.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/check_points': (context) => CheckPointsPage(),
    '/home': (context) => HomePage(),
    '/profile': (content) => ProfilePage(),
    '/edit_profile': (content) => EditProfilePage(),
    '/homecontent': (content) => HomeContentPage(),
    '/recipe_detail': (content) => RecipeScreen(),
    '/search': (content) => SearchPage(),
    '/settings': (content) => SettingsPage(),
    '/user_recipes': (content) => UserRecipePage(),
    '/restaurant': (content) => RestaurantPage(),
    '/restaurant_detail': (content) => RestaurantContent(),
    '/recipe': (content) => RecipePage(),
    '/upload_recipe': (content) => UploadRecipePage()
  };
}
