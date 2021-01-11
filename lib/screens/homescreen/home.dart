import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/screens/recipe/recipe.dart';
import 'package:sdp_project/screens/recipe/upload_recipe.dart';
import 'package:sdp_project/theme/custom.dart';
import '../../loginBloc.dart';
import '../../loginRepo.dart';
import 'homecontent.dart';
import '../restaurant/restaurant.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginRepo()),
      child: HomeUI(),
    );
  }
}

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
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
