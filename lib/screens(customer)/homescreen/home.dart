import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdp_project/bloc/homerecipe/homerecipeBloc.dart';
import 'package:sdp_project/bloc/homerestaurant/homerestaurantBloc.dart';

import '../../theme/custom.dart';
import '../recipe/recipe.dart';
import '../recipe/upload_recipe.dart';
import '../restaurant/restaurant.dart';
import 'homecontent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
          title: Center(
            child: Image(
              image: AssetImage('assets/logo2.png'),
              fit: BoxFit.cover,
              height: 93,
            ),
          ),
          actions: <Widget>[]),
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
      BlocProvider.of<HomeRecipeBloc>(context).add(
        FetchHomeRecipeData(null),
      );
      BlocProvider.of<HomeRestaurantBloc>(context).add(
        FetchHomeRestaurantData(null),
      );
      _currentIndex = index;
    });
  }
}
