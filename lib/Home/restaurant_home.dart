import 'package:flutter/material.dart';
import 'package:sdp_project/Reviews/Review.dart';
import '../Reservation/Reservation.dart';
import 'restaurant_homecontent.dart';
import '../Menu/Menu.dart';
import '../Reviews/Review.dart';
import 'package:sdp_project/Home/Edit_Profile.dart';

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
      appBar: AppBar(title: Text('Restaurant Main Page'),
      ),
      drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
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
            onTap: (){
            Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditProfile()));
          },
        ),
           new ListTile(
            title: new Text("Log Out"),
            trailing: new Icon(Icons.logout),
            onTap: (){
            // Navigator.of(context)
            //   .push(MaterialPageRoute(builder: (context) => EditProfile()));
          },
        )
      ]
    ),
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