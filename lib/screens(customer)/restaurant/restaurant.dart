import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/homerestaurant/homerestaurantBloc.dart';
import '../../bloc/homerestaurant/homerestaurantModel.dart';
import '../../bloc/menu/menuBloc.dart';
import '../homescreen/home.dart';
import 'restaurant_detail.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<HomeRestaurantModel> resdata = [];

  @override
  Widget build(BuildContext context) {
    resdata = BlocProvider.of<HomeRestaurantBloc>(context).result;

    return ListView(
      children: [
        BlocBuilder<HomeRestaurantBloc, HomeRestaurantState>(
          builder: (context, state) {
            if (state is LoadingHomeRestaurantData) {
              return LinearProgressIndicator();
            }
            if (state is HomeRestaurantDataLoaded) {
              return Restaurant();
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
    );
  }
}

class Restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeRestaurantModel> resdata =
        BlocProvider.of<HomeRestaurantBloc>(context).result;

    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 40,
            child: Text(
              "Restaurant",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 550,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: resdata == null ? 0 : resdata.length,
              itemBuilder: (context, index) {
                return RestaurantList(resdata[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  final resdata;
  RestaurantList(this.resdata);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: 10.0, top: 15.0),
            leading: CachedNetworkImage(
              height: 150,
              width: 150,
              fit: BoxFit.fill,
              imageUrl:
                  'https://czechoslovakian-scr.000webhostapp.com/uploads(Profile)/${resdata.image}',
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fadeOutDuration: new Duration(seconds: 1),
              fadeInDuration: new Duration(seconds: 3),
            ),
            title: new Text(
              resdata.resname,
              style:
                  GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(resdata.email),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('More Info'),
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
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
