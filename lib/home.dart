import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Column(
        children: <Widget> [
            Text('hey'),
            Text('wazzup'),
            Text('aye man')
        ]
    ),
    Column(
        children: <Widget> [
            Text('guten'),
            Text('morgend')
        ]
    ),
    ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
            Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
            ),
            Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry B')),
            ),
            Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
            ),
        ],
    )
  ];

@override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('My Flutter App'),
     ),
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
           icon: Icon(Icons.mail),
           title: Text('Messages'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
   );
 }
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}