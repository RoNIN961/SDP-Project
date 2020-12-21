import 'package:flutter/material.dart';
import 'settings.dart';
import 'profile.dart';
import 'homecontent.dart';
import 'restaurant.dart';
import 'search.dart';

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
    SearchPage(),
    ProfilePage(),
    RestaurantPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/check_points');
          },
          child: Text("Check Points"),
        )
      ]),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text('Restaurants'),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Settings'),
            backgroundColor: Colors.deepOrange,
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; //test
    });
  }
}
