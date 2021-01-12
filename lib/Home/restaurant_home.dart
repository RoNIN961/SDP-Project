import 'package:flutter/material.dart';
import 'package:sdp_project/Reviews/Review.dart';
import '../Reservation/Reservation.dart';
import 'restaurant_homecontent.dart';
import '../Menu/Menu.dart';
import '../Reviews/Review.dart';

class RestaurantHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestaurantHomeState();
  }
}

class _RestaurantHomeState extends State<RestaurantHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [RestaurantHomeContent(),MenuPage(),ReservationPage(),ReviewPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            title: Text("Menu"),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text("Reservation"),
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            title: Text("Review"),
            backgroundColor: Colors.deepOrange,
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
//eating