import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';
import 'homecontent.dart';

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
    Column(children: <Widget>[Text('guten'), Text('morgend')]),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'), actions: <Widget>[
        FlatButton(
          onPressed: () {},
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
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text('Restaurants'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.menu), title: Text('Settings'))
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
