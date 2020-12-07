import 'package:flutter/material.dart';
import 'homecontent.dart';
import 'profile.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContentPage(),
    Column(children: <Widget>[Text('guten'), Text('morgend')]),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
              child: Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )),
          Container(
            width: 80.0,
            height: 80.0,
            child: Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.thestar.com.my%2Ffood%2Feating-out%2F2020%2F02%2F28%2Fenjoy-value-for-money-pizza&psig=AOvVaw2GvEReG91Ytq38g_H_OaBm&ust=1607414307412000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjgjomzu-0CFQAAAAAdAAAAABAJ'),
          ),
          Text('Ingredients'),
          Text('Steps'),
          _children[_currentIndex],
          BottomNavigationBar(
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text('Messages'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile'))
            ],
          ),
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
