import '../screens(customer)/authentication/login/login.dart';
import '../screens(customer)/authentication/register.dart';
import '../screens(customer)/homescreen/check_points.dart';
import '../screens(customer)/homescreen/home.dart';
import '../screens(customer)/profile/profile.dart';
import '../screens(customer)/profile/edit_profile.dart';
import '../screens(customer)/homescreen/homecontent.dart';
import '../screens(customer)/recipe/recipe_detail.dart';
import '../screens(customer)/recipe/search.dart';
import '../screens(customer)/homescreen/settings.dart';
import '../screens(customer)/recipe/user_recipes.dart';
import '../screens(customer)/restaurant/restaurant.dart';
import '../screens(customer)/restaurant/restaurant_detail.dart';
import '../screens(customer)/recipe/recipe.dart';
import '../screens(customer)/recipe/upload_recipe.dart';

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
