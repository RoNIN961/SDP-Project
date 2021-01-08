import 'login.dart';
import 'register.dart';
import 'profile.dart';
import 'restaurant_home.dart';
import 'restaurant_homecontent.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/profile': (content) => ProfilePage(),
    '/rest_home': (context) => RestaurantHome(),
    '/rest_homecontent': (content) => RestaurantHomeContent(),
  };
}