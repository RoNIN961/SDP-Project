import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdp_project/bloc/menu/menuBloc.dart';
import 'package:sdp_project/screens(customer)/recipe/recipe_info.dart';
import 'package:sdp_project/screens(customer)/restaurant/restaurant_detail.dart';

import '../../bloc/homerecipe/homerecipeBloc.dart';
import '../../bloc/homerecipe/homerecipeModel.dart';
import '../../bloc/homerestaurant/homerestaurantBloc.dart';
import '../../bloc/homerestaurant/homerestaurantModel.dart';
import 'home.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          BlocBuilder<HomeRecipeBloc, HomeRecipeState>(
            builder: (context, state) {
              if (state is LoadingHomeRecipeData) {
                return LinearProgressIndicator();
              }
              if (state is HomeRecipeDataLoaded) {
                return CustomRecipeListView();
              }
              if (state is HomeRecipeFailedLoad) {
                return Center(
                  child: Text(
                    'Failed To Load',
                    style: GoogleFonts.inter(fontSize: 30),
                  ),
                );
              }
              return HomePage();
            },
          ),
          BlocBuilder<HomeRestaurantBloc, HomeRestaurantState>(
            builder: (context, state) {
              if (state is LoadingHomeRestaurantData) {
                return LinearProgressIndicator();
              }
              if (state is HomeRestaurantDataLoaded) {
                return CustomRestaurantListView();
              }
              if (state is HomeRestaurantFailedLoad) {
                return Center(
                  child: Text(
                    'Failed To Load',
                    style: GoogleFonts.inter(fontSize: 30),
                  ),
                );
              }
              return HomePage();
            },
          ),
        ],
      ),
    );
  }
}

class CustomRecipeListView extends StatefulWidget {
  @override
  _CustomRecipeListViewState createState() => _CustomRecipeListViewState();
}

class _CustomRecipeListViewState extends State<CustomRecipeListView> {
  List<HomeRecipeModel> recipedata = [];

  @override
  Widget build(BuildContext context) {
    recipedata = BlocProvider.of<HomeRecipeBloc>(context).result;

    return Container(
      height: 280.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "New & Updated Recipe",
                  style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                child: Text(
                  "Selected Recipes For You",
                  style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
                ),
              ),
              Expanded(child: Recipe()),
            ],
          ),
        ),
      ),
    );
  }
}

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeRecipeModel> recipedata =
        BlocProvider.of<HomeRecipeBloc>(context).result;

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding:
          const EdgeInsets.only(top: 15.00, bottom: 15.00, left: 8, right: 4),
      itemCount: recipedata == null ? 0 : recipedata.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: RecipeList(recipedata[index]),
        );
      },
    );
  }
}

class RecipeList extends StatelessWidget {
  final recipedata;
  RecipeList(this.recipedata);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white54),
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new CachedNetworkImage(
            width: 200,
            height: 100,
            fit: BoxFit.fill,
            imageUrl:
                'https://czechoslovakian-scr.000webhostapp.com/uploads(Recipe)/${recipedata.image}',
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fadeOutDuration: new Duration(seconds: 1),
            fadeInDuration: new Duration(seconds: 3),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2.0),
                    ),
                    Text(
                      recipedata.title == null ? '' : recipedata.title,
                      style: TextStyle(
                          color: Color(0xff202124),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                    ),
                    Text(
                      recipedata.username == null ? '' : recipedata.username,
                      style: TextStyle(
                          color: Color(0xff5f6368),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeInfoPage(recipedata),
                      ),
                    );
                  },
                  child: Text('More Info'),
                  color: Colors.deepOrange,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomRestaurantListView extends StatefulWidget {
  @override
  _CustomRestaurantListViewState createState() =>
      _CustomRestaurantListViewState();
}

class _CustomRestaurantListViewState extends State<CustomRestaurantListView> {
  List<HomeRestaurantModel> resdata = [];

  @override
  Widget build(BuildContext context) {
    resdata = BlocProvider.of<HomeRestaurantBloc>(context).result;

    return Container(
      height: 280.0,
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Color(0xffeeeeee),
          blurRadius: 1.0,
          offset: new Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "New & Updated Restaurants",
                  style: TextStyle(color: Color(0xff616161), fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                child: Text(
                  "Selected Restaurants For You",
                  style: TextStyle(color: Color(0xff616161), fontSize: 12.0),
                ),
              ),
              Expanded(child: Restaurant()),
            ],
          ),
        ),
      ),
    );
  }
}

class Restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeRestaurantModel> resdata =
        BlocProvider.of<HomeRestaurantBloc>(context).result;

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding:
          const EdgeInsets.only(top: 15.00, bottom: 15.00, left: 8, right: 4),
      itemCount: resdata == null ? 0 : resdata.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: RestaurantList(resdata[index]),
        );
      },
    );
  }
}

class RestaurantList extends StatelessWidget {
  final resdata;
  RestaurantList(this.resdata);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white54),
      margin: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new CachedNetworkImage(
            width: 200,
            height: 100,
            fit: BoxFit.fill,
            imageUrl:
                'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/${resdata.image}',
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fadeOutDuration: new Duration(seconds: 1),
            fadeInDuration: new Duration(seconds: 3),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2.0),
                    ),
                    Text(
                      resdata.resname == null ? '' : resdata.resname,
                      style: TextStyle(
                          color: Color(0xff202124),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                    ),
                    Text(
                      resdata.contact == null ? '' : resdata.contact,
                      style: TextStyle(
                          color: Color(0xff5f6368),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: MaterialButton(
                  onPressed: () {
                    BlocProvider.of<MenuBloc>(context).add(
                      FetchMenuData(resdata.resid),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantContent(resdata),
                      ),
                    );
                  },
                  child: Text('More Info'),
                  color: Colors.deepOrange,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
