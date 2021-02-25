import '../authentication/login.dart';
import '../authentication/register.dart';
import '../screens(admin)/add_restaurant.dart';
import '../screens(admin)/listview.dart';
import '../screens(admin)/navbar.dart';
import '../screens(customer)/homescreen/home.dart';
import '../screens(customer)/homescreen/homecontent.dart';
import '../screens(customer)/profile/edit_profile.dart';
import '../screens(customer)/profile/profile.dart';
import '../screens(customer)/recipe/recipe.dart';
import '../screens(customer)/recipe/upload_recipe.dart';
import '../screens(customer)/recipe/user_recipes.dart';
import '../screens(customer)/restaurant/restaurant.dart';
import '../screens(restaurant)/home/restaurant_home.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/home': (context) => HomePage(),
    '/profile': (content) => ProfilePage(),
    '/edit_profile': (content) => EditProfilePage(),
    '/homecontent': (content) => HomeContentPage(),
    '/user_recipes': (content) => UserRecipePage(),
    '/restaurant': (content) => RestaurantPage(),
    '/recipe': (content) => RecipePage(),
    '/upload_recipe': (content) => UploadRecipePage(),
    '/restaurant_home': (context) => RestaurantHome(),
    '/admin_home': (context) => Nav(),
    '/add_restaurant': (context) => AddRestaurant(),
    '/admin_listview': (context) => UserListPage(),
  };
}
