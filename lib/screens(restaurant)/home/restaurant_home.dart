import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login/loginBloc.dart';
import '../../bloc/menu/menuBloc.dart';
import '../../bloc/restaurant/restaurantBloc.dart';
import '../Menu/Menu.dart';
import '../reservations/reservation.dart';
import '../reviews/review.dart';
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
    String restaurantname = BlocProvider.of<LoginBloc>(context).name;
    String restaurantemail = BlocProvider.of<LoginBloc>(context).email;

    String image = BlocProvider.of<RestaurantBloc>(context).image;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image(
            image: AssetImage('assets/logo2.png'),
            fit: BoxFit.cover,
            height: 93,
          ),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(restaurantname),
            accountEmail: new Text(restaurantemail),
            currentAccountPicture: new CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/$image',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                )),
          ),
          new ListTile(
            title: new Text("View Account"),
            trailing: new Icon(Icons.people),
            onTap: () {
              BlocProvider.of<RestaurantBloc>(context).add(
                FetchRestaurantData(restaurantemail),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
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
      String resid = BlocProvider.of<RestaurantBloc>(context).resid;
      BlocProvider.of<MenuBloc>(context).add(
        FetchMenuData(resid),
      );
      _currentIndex = index; //test
    });
  }
}
//eating
