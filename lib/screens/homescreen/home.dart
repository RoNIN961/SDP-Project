import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/screens/recipe/recipe.dart';
import 'package:sdp_project/screens/recipe/upload_recipe.dart';
import 'package:sdp_project/screens/restaurant/restaurantBloc.dart';
import 'package:sdp_project/theme/custom.dart';
import 'homecontent.dart';
import '../restaurant/restaurant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantBloc _restaurantBloc;

  List<RestaurantBloc> _restaurant = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                if (state is NotFetched) {
                  print(_restaurantBloc.state);
                }
                if (state is LoadingRestaurantData) {
                  return Center(
                      child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                }
                if (state is DataFetched) {
                  _restaurant = [];
                  return HomePageUI();
                }
                if (state is DataFetchFail) {
                  return SizedBox(
                    child: Text('Something went wrong'),
                  );
                }
                return SizedBox(
                  height: 30,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageUI extends StatefulWidget {
  @override
  _HomePageUIState createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContentPage(),
    RestaurantPage(),
    RecipePage(),
    UploadRecipePage(),
  ];

  @override
  Widget build(context) {
    return Container(
      height: 708,
      child: Scaffold(
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
        drawer: Drawer(
            child: CustomDrawer(
          email: 'placeholder',
          name: 'placeholder',
        )),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
