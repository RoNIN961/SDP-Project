import 'package:flutter/material.dart';
import 'package:sdp_project/screens(customer)/recipe/recipe.dart';
import 'package:sdp_project/screens(customer)/recipe/upload_recipe.dart';
import 'package:sdp_project/theme/custom.dart';
import 'homecontent.dart';
import '../restaurant/restaurant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContentPage(),
    RestaurantPage(),
    RecipePage(),
    UploadRecipePage()
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        )
      ]),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Restaurants',
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
              backgroundColor: Colors.deepOrange),
          new BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Upload',
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
