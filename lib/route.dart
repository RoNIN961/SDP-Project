import 'Login/login.dart';
import 'Login/register.dart';
import 'profile.dart';
import 'Home/restaurant_home.dart';
import 'Home/restaurant_homecontent.dart';

getroute() {
  return {
    '/': (context) => LoginPage(),
    '/register': (context) => RegisterPage(),
    '/profile': (content) => ProfilePage(),
    '/rest_home': (context) => RestaurantHome(),
    '/rest_homecontent': (content) => RestaurantHomeContent(),
    
  };
}