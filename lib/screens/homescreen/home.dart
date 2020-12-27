import 'package:flutter/material.dart';
import 'package:sdp_project/screens/recipe/recipe.dart';
import 'package:sdp_project/theme/custom.dart';
import 'homecontent.dart';
import '../restaurant/restaurant.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContentPage(),
    RestaurantPage(),
    RecipePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[]),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              title: Text('Restaurants'),
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Recipes'),
              backgroundColor: Colors.deepOrange)
        ],
      ),
      drawer: Drawer(child: CustomDrawer()),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
