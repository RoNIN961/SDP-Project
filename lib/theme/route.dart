import 'package:sdp_project/screens(admin)/navbar.dart';

import '../authentication/login.dart';
import '../authentication/register.dart';
import '../screens(customer)/homescreen/home.dart';
import '../screens(customer)/profile/profile.dart';
import '../screens(customer)/profile/edit_profile.dart';
import '../screens(customer)/homescreen/homecontent.dart';
import '../screens(customer)/recipe/recipe_detail.dart';
import '../screens(customer)/recipe/search.dart';
import '../screens(customer)/recipe/user_recipes.dart';
import '../screens(customer)/restaurant/restaurant.dart';
import '../screens(customer)/restaurant/restaurant_detail.dart';
import '../screens(customer)/recipe/recipe.dart';
import '../screens(customer)/recipe/upload_recipe.dart';
import '../screens(restaurant)/home/restaurant_home.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/home': (context) => HomePage(),
    '/profile': (content) => ProfilePage(),
    '/edit_profile': (content) => EditProfilePage(),
    '/homecontent': (content) => HomeContentPage(),
    '/recipe_detail': (content) => RecipeScreen(),
    '/search': (content) => SearchPage(),
    '/user_recipes': (content) => UserRecipePage(),
    '/restaurant': (content) => RestaurantPage(),
    '/restaurant_detail': (content) => RestaurantContent(),
    '/recipe': (content) => RecipePage(),
    '/upload_recipe': (content) => UploadRecipePage(),
    '/restaurant_home': (context) => RestaurantHome(),
    '/admin_home': (context) => Nav(),
  };
}
