import 'package:flutter/material.dart';
import '../reviews/review.dart';
import '../reservations/reservation.dart';
import '../Menu/Menu.dart';
import 'edit_profile.dart';
import 'restaurant_homecontent.dart';

class RestaurantHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestaurantHomeState();
  }
}

class _RestaurantHomeState extends State<RestaurantHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    RestaurantHomeContent(),
    MenuPage(),
    ReservationPage(),
    ReviewPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Main Page'),
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('KFC'),
            accountEmail: new Text('kfc@mail.com'),
            currentAccountPicture: new CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/KFC.png"),
            ),
          ),
          new ListTile(
            title: new Text("View Account"),
            trailing: new Icon(Icons.people),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          new ListTile(
            title: new Text("Log Out"),
            trailing: new Icon(Icons.logout),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ]),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Menu",
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Reservation",
            backgroundColor: Colors.deepOrange,
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: "Review",
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
